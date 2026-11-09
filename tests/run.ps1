param([string]$SdkDirectory = '')
$ErrorActionPreference = 'Stop'
if (-not $SdkDirectory) { $SdkDirectory = Split-Path (Get-Command rdk.exe -ErrorAction Stop).Source }

# O SDK instalado fornece Lua 5.4 de 32 bits; não precisa instalar outro runtime.
if ([Environment]::Is64BitProcess) {
    $testHost = Join-Path $env:WINDIR 'SysWOW64/WindowsPowerShell/v1.0/powershell.exe'
    & $testHost -NoProfile -ExecutionPolicy Bypass -File $PSCommandPath -SdkDirectory $SdkDirectory
    exit $LASTEXITCODE
}
if (-not (Test-Path -LiteralPath (Join-Path $SdkDirectory 'lua54x86.dll'))) { throw 'Lua 5.4 não encontrado no SDK do Firecast.' }
Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;
using System.Text;
public static class LuaTestRunner {
    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    public static extern bool SetDllDirectory(string directory);
    [DllImport("lua54x86.dll", CallingConvention = CallingConvention.Cdecl)]
    static extern IntPtr luaL_newstate();
    [DllImport("lua54x86.dll", CallingConvention = CallingConvention.Cdecl)]
    static extern void luaL_openlibs(IntPtr state);
    [DllImport("lua54x86.dll", CallingConvention = CallingConvention.Cdecl)]
    static extern int luaL_loadfilex(IntPtr state, string file, IntPtr mode);
    [DllImport("lua54x86.dll", CallingConvention = CallingConvention.Cdecl)]
    static extern int lua_pcallk(IntPtr state, int args, int results, int error, IntPtr context, IntPtr callback);
    [DllImport("lua54x86.dll", CallingConvention = CallingConvention.Cdecl)]
    static extern IntPtr lua_tolstring(IntPtr state, int index, out UIntPtr size);
    [DllImport("lua54x86.dll", CallingConvention = CallingConvention.Cdecl)]
    static extern void lua_close(IntPtr state);
    public static int Run(string file) {
        IntPtr state = luaL_newstate();
        if (state == IntPtr.Zero) throw new Exception("Falha ao iniciar Lua.");
        try {
            luaL_openlibs(state);
            int status = luaL_loadfilex(state, file, IntPtr.Zero);
            if (status == 0) status = lua_pcallk(state, 0, -1, 0, IntPtr.Zero, IntPtr.Zero);
            if (status != 0) {
                UIntPtr length;
                IntPtr pointer = lua_tolstring(state, -1, out length);
                if (pointer != IntPtr.Zero) {
                    byte[] bytes = new byte[checked((int)length.ToUInt64())];
                    Marshal.Copy(pointer, bytes, 0, bytes.Length);
                    Console.Error.WriteLine(Encoding.UTF8.GetString(bytes));
                }
            }
            return status;
        } finally { lua_close(state); }
    }
}
'@
if (-not [LuaTestRunner]::SetDllDirectory($SdkDirectory)) { throw 'Não foi possível carregar o SDK.' }
$previousDirectory = [Environment]::CurrentDirectory
try {
    [Environment]::CurrentDirectory = Split-Path $PSScriptRoot -Parent
    foreach ($testFile in @('tests/condicoes_test.testlua', 'tests/feiticos_update_test.testlua', 'tests/updater_test.testlua')) {
        $result = [LuaTestRunner]::Run($testFile)
        if ($result -ne 0) { exit $result }
    }
} finally { [Environment]::CurrentDirectory = $previousDirectory }
exit 0

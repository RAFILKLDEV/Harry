# Atualizações do plugin

O plugin verifica uma vez por inicialização a versão da release mais recente. Se ainda não houver release (HTTP 404), compara com a versão de `module.xml` no branch `master` e baixa o pacote compilado `output/Harry.rpk` desse branch. A comparação é semântica; versões antigas no formato `major.minor`, como `2.0`, são lidas como `2.0.0`. Se houver uma versão mais nova, o Firecast pergunta antes de baixar o `.rpk`. O instalador valida o `moduleId` e a versão do pacote. Se o Firecast recusar a instalação, é oferecida a abertura do mesmo `.rpk` no navegador para instalação manual.

## Publicar uma versão

1. Altere `module.xml` para a nova versão `major.minor.patch`.
2. No Windows com o SDK do Firecast instalado, execute `.\build.ps1` para compilar e validar `output\Harry.rpk`.
3. Envie `module.xml` e `output\Harry.rpk` ao GitHub.
4. Crie e envie uma tag que corresponda à versão, por exemplo `v4.0.1`. A workflow `Publicar versão do plugin` valida o pacote e publica `Harry.rpk` na release. Sem release, o atualizador usa `module.xml` e `output/Harry.rpk` já compilados e enviados no branch `master`. O compilador `rdk.exe` não é distribuído com o repositório.

## Testar a atualização

Execute `.\tests\run.ps1` para testar a comparação semântica, a detecção por release e branch, a validação do módulo, a instalação simulada e o fallback manual. Para testar no Firecast sem criar release, aumente `module.xml`, compile com `.\build.ps1`, envie `module.xml` e `output\Harry.rpk` ao branch `master` e abra uma ficha instalada em uma versão anterior. A confirmação deve aparecer uma vez. Também é possível publicar uma tag `vMAJOR.MINOR.PATCH` e usar a release criada pela workflow.

Não há atualização de dados de ficha nem execução de código remoto: somente arquivos `.rpk` publicados como assets de release são baixados.

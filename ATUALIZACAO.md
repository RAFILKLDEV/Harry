# Atualizações do plugin

O plugin verifica uma vez por inicialização a versão publicada na release mais recente deste repositório. Se ainda não houver nenhuma release, o GitHub responde HTTP 404 e a verificação termina sem exibir erro ou oferta de atualização. A comparação é semântica; versões antigas no formato `major.minor`, como `2.0`, são lidas como `2.0.0`. Se houver uma versão mais nova, o Firecast pergunta antes de baixar o `.rpk`. O instalador valida o `moduleId` e a versão do pacote. Se o Firecast recusar a instalação, é oferecida a abertura do download manual.

## Publicar uma versão

1. Altere `module.xml` para a nova versão `major.minor.patch`.
2. No Windows com o SDK do Firecast instalado, execute `.\build.ps1` para compilar e validar `output\Harry.rpk`.
3. Envie `module.xml` e `output\Harry.rpk` ao GitHub.
4. Crie e envie uma tag que corresponda à versão, por exemplo `v2.0.1`. A workflow `Publicar versão do plugin` valida o pacote e publica `Harry.rpk` na release. O plugin consulta a tag da release mais recente pela API do GitHub. O compilador `rdk.exe` não é distribuído com o repositório; a workflow publica o pacote já compilado pelo SDK.

## Testar a atualização

Execute `.\tests\run.ps1` para testar a comparação de versões, o cenário `2.0.0` → `2.0.1`, a validação do módulo, a instalação simulada e o fallback manual. Para testar no Firecast, instale um pacote de versão anterior, publique uma release com a versão seguinte e abra uma ficha: a confirmação deve aparecer uma vez. Recusar ou aceitar a instalação permite testar os dois caminhos; para testar o fallback, use um ambiente em que o Firecast recuse a instalação automática.

Não há atualização de dados de ficha nem execução de código remoto: somente arquivos `.rpk` publicados como assets de release são baixados.

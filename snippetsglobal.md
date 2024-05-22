### Criando Snippets Compartilhados no VS Code

Para criar snippets que possam ser utilizados em todos os projetos que você criar no VS Code, você pode armazená-los em um local centralizado. O VS Code permite configurar snippets globais que serão acessíveis em qualquer projeto, independentemente do diretório em que você esteja trabalhando. Veja como fazer isso:

#### Passo 1: Crie uma Pasta para seus Snippets

Primeiro, crie uma pasta em seu sistema onde você deseja armazenar os snippets compartilhados. Por exemplo, você pode criar uma pasta chamada `vscode-snippets` em seu diretório home:

```bash
mkdir ~/vscode-snippets
```

#### Passo 2: Crie o Arquivo de Snippets

Dentro dessa pasta, crie um arquivo JSON para armazenar seus snippets. Por exemplo, `global-snippets.code-snippets`:

```bash
touch ~/vscode-snippets/global-snippets.code-snippets
```

#### Passo 3: Adicione os Snippets ao Arquivo

Abra o arquivo `global-snippets.code-snippets` no VS Code:

```bash
code ~/vscode-snippets/global-snippets.code-snippets
```

Adicione seus snippets no formato JSON. Por exemplo:

```json
{
    "Print Hello World": {
        "prefix": "hello",
        "body": [
            "echo 'Hello, World!'"
        ],
        "description": "Print Hello World to console"
    },
    "Print to console": {
        "prefix": "log",
        "body": [
            "console.log('$1');",
            "$2"
        ],
        "description": "Log output to console"
    }
}
```

#### Passo 4: Configurar o VS Code para Usar Snippets Globais

Infelizmente, o VS Code não permite diretamente configurar uma pasta externa para os snippets globais através de sua interface de usuário. No entanto, você pode utilizar links simbólicos para alcançar um efeito similar.

Crie um link simbólico do seu arquivo de snippets para o diretório de snippets do VS Code. No Linux, esse diretório geralmente está localizado em `~/.config/Code/User/snippets`.

```bash
ln -s ~/vscode-snippets/global-snippets.code-snippets ~/.config/Code/User/snippets/global-snippets.code-snippets
```

#### Passo 5: Reinicie o VS Code

Após criar o link simbólico, reinicie o VS Code. Seus snippets devem estar disponíveis em todos os projetos.


### =============================================================================================

### Usando Vários Arquivos de Snippets no VS Code

Sim, você pode ter múltiplos arquivos de snippets com nomes diferentes no VS Code. Isso permite que você organize seus snippets de maneira mais estruturada e específica. Veja como você pode fazer isso:

#### Passo 1: Crie Arquivos de Snippets

1. No diretório onde você deseja armazenar seus snippets (por exemplo, `~/vscode-snippets`), crie múltiplos arquivos `.code-snippets` com nomes descritivos. Por exemplo:

    ```bash
    mkdir -p ~/vscode-snippets
    touch ~/vscode-snippets/javascript-snippets.code-snippets
    touch ~/vscode-snippets/python-snippets.code-snippets
    ```

2. Adicione os snippets desejados em cada arquivo. Por exemplo, no arquivo `javascript-snippets.code-snippets`:

    ```json
    {
        "Print to console": {
            "prefix": "log",
            "body": [
                "console.log('$1');",
                "$2"
            ],
            "description": "Log output to console"
        }
    }
    ```

3. E no arquivo `python-snippets.code-snippets`:

    ```json
    {
        "Print to console": {
            "prefix": "print",
            "body": [
                "print('$1')"
            ],
            "description": "Print output to console"
        }
    }
    ```

#### Passo 2: Linkar Arquivos ao Diretório de Snippets do VS Code

Para fazer com que o VS Code reconheça esses arquivos, você pode criar links simbólicos para o diretório de snippets do VS Code:

```bash
ln -s ~/vscode-snippets/javascript-snippets.code-snippets ~/.config/Code/User/snippets/javascript-snippets.code-snippets
ln -s ~/vscode-snippets/python-snippets.code-snippets ~/.config/Code/User/snippets/python-snippets.code-snippets
```
REINICIAR O VSCODE
---
marp: true
paginate: true
lang: pt-BR

---
![bg right 80%](../../imgs/03-aula/bash-icon-svgrepo-com.svg)
![bg 80%](../../imgs/03-aula/coding.png)

# Terminal e Gerenciamento de Arquivos
---
**Sumário**
- Shell Básico
- Pipe e Fluxo Padrão de I/O (stdin, stdout, stder)
- Redirecionamento
- Gerenciamento de Arquivo
- Gerenciamento de Pacotes

---
## Shell Básico
**Shell:**
O shell é a interface que atua como camada externa entre o usuário e o núcleo do sistema operacional (kernel). 

Ele opera de duas maneiras:
- como um interpretador de comandos
- como linguagem de programação

**Bash:**
Bash é o shell padrão na maioria dos S.O. GNU/Linux. O seu nome é um acrônimo para "Bourne Again SHell", que é um trocadilho com o nome de Stephen Bourne, o autor do antecessor direto do atual shell `sh` (Bourne Shell) do Unix.

---
## Pipe e Fluxo Padrão de I/O (stdin, stdout, stder)

**Fluxo Padrão de I/O:**
Em sistemas baseados em Unix, a comunicação de dados com os programas é feita através de fluxos padrão, identificados por números chamados descritores de arquivo.
- **Standard Input (stdin):** É a entrada padrão, associada ao descritor de arquivo 0. Ele lê os dados diretamente do terminal, mas pode ser redirecionada para ler o conteúdo de um arquivo utilizando o operador `<`.

- **Standard Output (stdout):** É a saída padrão, associada ao descritor de arquivo 1. Ele imprimir os resultados de um comando. Pode ser redirecionada para gravar dados num arquivo usando o operador `>` ou `>>`.

---
- **Standard Error (stderr):** É a saída de erro padrão, associada ao descritor de arquivo 2. Utilizada especificamente para exibir mensagens de aviso e erros na tela. Pode ser redirecionada para um arquivo isoladamente usando `2>` ou `2>&1` para fundir a saída padrão com a saída de erros.

**Pipe:**
Um pipe é um mecanismo para comunicação entre comandos, representado no shell pelo operador de barra vertical `|`. Ele conecta diretamente a saída padrão (stdout) de um comando à entrada padrão (stdin) do comando seguinte.


---
## Redirecionamento
**Redirecionamento:**
- `>` (Redirecionamento de Saída): Direciona a saída padrão (stdout) para um arquivo. Se o arquivo não existir, ele será criado; se já existir, o conteúdo anterior é sobrescrito.

- `>>` (Anexar Saída): Assim como o `>`, redireciona a saída para um arquivo, criando-o se não existir. Contudo, se o arquivo já existir, os dados serão anexados ao final dele.

- `<` (Redirecionamento de Entrada): Faz com que o comando leia os dados a partir de um arquivo em vez do teclado (stdin).

---
- `&>` ou `>&` (Saída Padrão e de Erro): Direciona simultaneamente a saída padrão (stdout) e a saída de erro (stderr) para o mesmo arquivo. É o equivalente semântico da notação `>` arquivo `2>&1`.

- `<<`(Here Document): Orienta o shell a ler a entrada a partir da fonte atual até que encontre uma palavra ou caractere delimitador (sem espaços) fornecido pelo usuário, processando todo o bloco de texto como entrada.

- `<<<` (Here String): Uma variação do anterior, passa uma única string expandida pelo shell como entrada padrão para o comando.

---
## Gerenciamento de Arquivo
**Navegação:**
- `cd` para se movimentar
  - `cd` + `.` aponta para diretório atual
  - `cd` + `..` diretório anterior.

**Manipulação de Arquivos e Diretórios:**
- Criar: `mkdir` e `touch`.
- Ler: `cat`, `head` e `tail`.
- Copiar, Mover e Renomear: `cp` e `mv`.
- Apagar: `rm` e `rmdir`.
- Localizar: `find`.

---
## Gerenciamento de Pacotes
O gerenciador de pacotes é o software encarregado de instalar, atualizar e remover esses programas do sistema de maneira automatizada.

**Populares:**
- Debian: dpkg e apt
- Arch Linux: pacman
- Fedora: dnf

**Universais:**
- flatpak
- snap

---
## Comandos úteis

**Manipulação de Arquivos e Diretórios:**
| Comando | Descrição |
|-----------|-----------|
| `cp` | Copia arquivos e diretórios |
| `mv` | Move ou renomeia arquivos e diretórios |
| `rm` | Remove arquivos e diretórios |
| `mkdir` | Cria diretórios |
| `touch` | Cria arquivos vazios ou atualiza timestamps |
| `ln` | Cria links simbólicos ou hard links |
| `unlink` | Remove links para arquivos |

---
**Processamento de Texto:**
| Comando | Descrição |
|-----------|-----------|
| `echo` | Exibe texto na saída padrão |
| `printf` | Formata e exibe texto |
| `cat` | Concatena e exibe conteúdo de arquivos |
| `grep` | Busca por padrões em arquivos |
| `sed` | Editor de fluxo para transformar texto |
| `cut` | Remove seções de cada linha de arquivos |
| `tr` | Traduz ou deleta caracteres |

---
**Utilitários:**
| Comando | Descrição |
|-----------|-----------|
| `less` | Visualiza arquivos de forma paginada |
| `tail` | Exibe as últimas linhas de um arquivo |
| `head` | Exibe as primeiras linhas de um arquivo |
| `which` | Localiza o executável de um comando |
| `sudo` | Executa comandos como superusuário |
| `wget` | Baixa arquivos da web |
| `curl` | Transfere dados de ou para um servidor |
| `nano` | Editor de texto simples |

---
## Referencias
- [Este é o guia definitivo da pasta /home no Linux](https://diolinux.com.br/tutoriais/guia-da-pasta-home-linux.html)
- [A estrutura de diretórios Linux ](https://www.linuxando.com/tutorial.php?t=A%20estrutura%20de%20diret%C3%B3rios%20Linux_6)
- [Começando com o Linux Comandos, serviços e administração](https://www.casadocodigo.com.br/products/livro-linux)
- [Guia Pratico do servidor Linux](https://www.casadocodigo.com.br/products/livro-admin-linux)
- [Bash Manual](https://www.gnu.org/software/bash/manual/bash.html)
- [An Introduction to the UNIX Shell](https://www.di.ubi.pt/~crocker/prog3/unix_c_internets/sh.pdf)
- [Filesystem Hierarchy Standard](https://refspecs.linuxfoundation.org/fhs.shtml)

---
<!-- _paginate: skip -->

![bg fit ](../../imgs/fim.png)
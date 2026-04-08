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

**Bash**: Shell padrão em GNU/Linux. Acrônimo para "Bourne Again SHell" - trocadilho com Stephen Bourne, autor do `sh`

---
## Pipe e Fluxo Padrão de I/O
**Fluxos Padrão:**
- **stdin (0):** Entrada padrão do teclado
- **stdout (1):** Saída padrão de resultados
- **stderr (2):** Saída de erros

**Pipe (`|`):** Conecta stdout de um comando ao stdin do próximo
- Ex: `comando1 | comando2`

---
## Redirecionamento
**Operadores:**
- `>` - Sobrescreve arquivo
- `>>` - Anexa ao arquivo
- `<` - Lê de arquivo
- `2>` - Redireciona stderr
- `&>` - Redireciona stdout e stderr
- `<<` - Here Document
- `<<<` - Here String

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
![bg left:35%](../../imgs/common/nana-question.png)

**Tarefa: Criar um "pipeline" de processamento de logs**
- Liste os arquivos de `/usr/bin` e direcione a saída para um arquivo chamado comandos.txt usando o operador `>`.

- Use o `grep` para filtrar apenas comandos que contenham a palavra "zip" dentro desse arquivo e anexe o resultado em um arquivo filtrados.log usando `>>`.

---
![bg left:35%](../../imgs/common/nana-question.png)

- Tente listar um diretório que não existe e redirecione o erro (stderr) para um arquivo erros.log usando `2>`.

- Combine `cat`, `grep` e `wc -l` usando Pipes (|) para contar quantas linhas do log possuem a palavra "error".

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

![bg fit ](../../imgs/common/fim.png)
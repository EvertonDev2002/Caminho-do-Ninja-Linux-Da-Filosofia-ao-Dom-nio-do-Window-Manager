---
marp: true
paginate: true
lang: pt-BR

---
![bg right 80%](../../imgs/02-aula/Logo_Linux_Mint.png)
![bg 80%](../../imgs/02-aula/open-folder.png)

# Instalação e Preparação do Ambiente

---
**Sumário**
- Estrutura de pastas do Linux
- Nomenclatura de Dispositivos
- Máquinas Virtuais
- Instalação Prática

---
## Estrutura de pastas
A estrutura de diretórios do Linux é totalmente hierárquica, organizada a partir de um diretório base conhecido como raiz e representado por uma barra ```/```. Essa organização geralmente segue a convenção FHS (Filesystem Hierarchy Standard), que define e padroniza os sistemas de arquivos para distribuições Linux e Unix.

---
**```/```:**
| Diretório | Descrição |
|-----------|-----------|
| `/bin` | Binários essenciais do sistema e comandos básicos |
| `/dev` | Arquivos de dispositivos |
| `/etc` | Arquivos de configuração do sistema |
| `/lib` | Bibliotecas compartilhadas essenciais |

---
| Diretório | Descrição |
|-----------|-----------|
| `/mnt` | Ponto de montagem para sistemas de arquivos temporários |
| `/opt` | Pacotes de software opcional e aplicações terceirizadas |
| `/proc` | Sistema de arquivos virtual com informações de processos |
| `/sys` | Sistema de arquivos virtual com informações do kernel |
| `/root` | Diretório home do usuário root |

---
| Diretório | Descrição |
|-----------|-----------|
| `/tmp` | Arquivos temporários |
| `/usr` | Programas, bibliotecas e documentação do usuário |
| `/var` | Dados variáveis (logs, cache, filas de email) |
| `/run` | Dados de tempo de execução de programas |
| `/home` | Diretórios home dos usuários do sistema |

---
**```/home/user```:**
| Diretório | Descrição |
|-----------|-----------|
| `Área de Trabalho` | Local para arquivos de trabalho rápido acesso |
| `Documentos` | Armazena documentos pessoais |
| `Downloads` | Arquivos baixados da internet |
| `Imagens` | Fotos e imagens |

---
| Diretório | Descrição |
|-----------|-----------|
| `Músicas` | Arquivos de áudio |
| `Vídeos` | Arquivos de vídeo |
| `Modelos` | Templates para novos documentos |
| `Público` | Pasta compartilhada com outros usuários |

---
Os arquivos ocultos começa com ```.``` 
| Diretório | Descrição |
|-----------|-----------|
| `.cache` | Dados em cache de aplicações |
| `.config` | Arquivos de configuração de programas |
| `.local` | Dados locais de aplicações |
| `.themes` | Temas do sistema |
| `.icons` | Ícones personalizados |

---
## Nomenclatura de Dispositivos
No Linux, vigora um princípio fundamental: "tudo é um arquivo". Isso significa que todo o hardware reconhecido pelo sistema, bem como os dispositivos virtuais, são abstraídos pelo Kernel e representados como arquivos.

---
**```/dev```:**
| Dispositivo | Descrição |
|-------------|-----------|
| `/dev/sda` | Primeiro disco rígido SATA |
| `/dev/sdb` | Segundo disco rígido SATA |
| `/dev/nvme` | SSD com interface NVMe |
| `/dev/null` | Dispositivo nulo (descarta dados) |
| `/dev/tty` | Terminal virtual |

---
## Máquinas Virtuais
Uma máquina virtual (VM) é um ambiente de computação que funciona como um sistema completamente isolado, com CPU, sistema operacional, memória, interface de rede e armazenamento próprios, abstraídos a partir do hardware de uma máquina física real

- Tipo 1 (Nativo): É instalado e executado diretamente sobre o hardware físico.
- Tipo 2 (Hospedado): Roda como um aplicativo convencional por cima do sistema operacional real. 

O.B.S.: Vamos utilizar o Gnome Boxes (tipo 2) em nossas aulas. 

---
# Instalação Prática
Para instalar o gnome boxes:
- Flatpak: `flatpak install flathub org.gnome.Boxes`
- APT: `sudo apt install gnome-boxes`
- Pacman: `sudo pacman -S gnome-boxes`

Em nossas aulas, vamos utilizar a distro Linux Mint. [Baixe a ISO no site oficial.](https://linuxmint.com/download.php)

---
## Comandos úteis

| Comando | Descrição |
|-----------|-----------|
| `lsblk` | Lista os dispositivos de bloco |
| `fdisk` | Ferramenta para gerenciar e visualizar partições de disco |
| `df` | Exibe o espaço livre e ocupado em cada partição montada |
| `ls` | Listar o conteúdo das pastas |
| `cd` | Essencial para navegar entre as pastas da estrutura |
| `fsck` | Este comando é usado para verificar e, opcionalmente, reparar um ou mais sistemas de arquivos |

---
## Referencias
- [About Oracle VirtualBox](https://www.virtualbox.org/manual/UserManual.html)
- [O que é virtualização?](https://www.redhat.com/pt-br/topics/virtualization/what-is-virtualization) 
- [Este é o guia definitivo da pasta /home no Linux](https://diolinux.com.br/tutoriais/guia-da-pasta-home-linux.html)
- [A estrutura de diretórios Linux ](https://www.linuxando.com/tutorial.php?t=A%20estrutura%20de%20diret%C3%B3rios%20Linux_6)
- [Começando com o Linux Comandos, serviços e administração](https://www.casadocodigo.com.br/products/livro-linux)
- [Filesystem Hierarchy Standard](https://refspecs.linuxfoundation.org/fhs.shtml)


---
<!-- _paginate: skip -->

![bg fit ](../../imgs/fim.png)
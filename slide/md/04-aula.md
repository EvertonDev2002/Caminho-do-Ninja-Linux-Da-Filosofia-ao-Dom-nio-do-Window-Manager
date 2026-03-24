---
marp: true
paginate: true
lang: pt-BR
---
![bg right 80%](../../imgs/04-aula/Btrfs_logo.png)
![bg 80%](../../imgs/04-aula/systemd.png)

# Gerenciamento, Administração e Init Systems

---
**Sumário**
- Permissões (chmod, chwon e chgrp)
- Systemd e systemd-free (runit)
- Sistemas de Arquivos (ext4 e BTRFS)
- Gerenciamento de Processos

---
## Permissões
O Linux é um sistema multiusuário e baseia sua segurança em um conjunto rigoroso de permissões que controlam o acesso. 

**Três categorias:**
| Símbolo | Categoria | Descrição |
|---------|-----------|-----------|
| `u` | Usuário | Dono do arquivo |
| `g` | Grupo | Grupo do arquivo |
| `o` | Outros | Demais usuários |
| `a` | Todos | Equivale a `ugo` |

---
**Nível de acesso:**
| Permissão | Letra | Descrição |
|-----------|-------|-----------|
| Leitura | `r` | Ler o conteúdo |
| Escrita | `w` | Modificar o conteúdo |
| Execução | `x` | Executar o arquivo |
| Especial (setuid/setgid) | `s` | Elevar privilégios na execução |

---
## Gerenciamento de Permissões
O comando `chmod` é utilizado para alterar as permissões de acesso de arquivos e diretórios. Ele pode ser operado de duas formas principais:

**Notação Simbólica:**
| Operador | Descrição | Exemplo |
|----------|-----------|---------|
| `+` | Adiciona permissão | `chmod u+x arquivo` |
| `-` | Remove permissão | `chmod g-w arquivo` |
| `=` | Define permissão exata | `chmod o=r arquivo` |

---
| Exemplo de Comando | Resultado |
|--------------------|-----------|
| `chmod u=rw,g=rw,o=rw arquivo` | Leitura e escrita para todos |
| `chmod a+x arquivo` | Execução adicionada para todos |
| `chmod g-w arquivo` | Remove escrita do grupo |
| `chmod o=--- arquivo` | Remove todas as permissões de outros |
| `chmod a-s arquivo` | Remove permissões especiais de todos |

---

### Notação Octal (Numérica):

| Permissão | Valor Octal |
|-----------|-------------|
| Leitura (`r`) | `4` |
| Escrita (`w`) | `2` |
| Execução (`x`) | `1` |
| Nenhuma (`-`) | `0` |

---
| Combinação | Representação | Cálculo | Valor |
|------------|---------------|---------|-------|
| Nenhuma | `---` | 0 | `0` |
| Execução | `--x` | 1 | `1` |
| Escrita | `-w-` | 2 | `2` |
| Escrita + Execução | `-wx` | 2+1 | `3` |
| Leitura | `r--` | 4 | `4` |
| Leitura + Execução | `r-x` | 4+1 | `5` |
| Leitura + Escrita | `rw-` | 4+2 | `6` |
| Todas | `rwx` | 4+2+1 | `7` |

---
| Exemplo de Comando | Dono | Grupo | Outros | Representação |
|--------------------|------|-------|--------|---------------|
| `chmod 777 arquivo` | `rwx` | `rwx` | `rwx` | Todos têm acesso total |
| `chmod 664 arquivo` | `rw-` | `rw-` | `r--` | Dono e grupo leem/escrevem; outros só leem |
| `chmod 755 arquivo` | `rwx` | `r-x` | `r-x` | Padrão para executáveis |
| `chmod 644 arquivo` | `rw-` | `r--` | `r--` | Padrão para arquivos comuns |

---
| Exemplo de Comando | Dono | Grupo | Outros | Representação |
|--------------------|------|-------|--------|---------------|
| `chmod 600 arquivo` | `rw-` | `---` | `---` | Privado ao dono |
| `chmod 000 arquivo` | `---` | `---` | `---` | Nenhum acesso |

---
O comando `chown` é utilizado para alterar o usuário dono de um arquivo ou diretório e, caso desejado, alterar o grupo simultaneamente.
```bash
# Sintaxe
chown novo_dono arquivo/diretório

# Alterando dono e grupo simultaneamente
sudo chown dono:grupo arquivo/diretório
```

---
O comando `chgrp` é focado especificamente em alterar o grupo ao qual um arquivo ou diretório pertence, sem afetar o usuário dono.
```bash
# Sintaxe
chgrp novo_grupo arquivo/diretório

# Alterando grupo 
sudo chgrp grupo arquivo/diretório
```

---
## Systemd e systemd-free
**Systemd:**
O systemd é uma suíte abrangente, funcionando como um gerenciador de sistema e serviços. Ele fornece paralelização agressiva, utiliza ativação por socket e D-Bus.

**Comandos básicos:**
- `systemctl start serviço/socket`
- `systemctl stop serviço/socket`
- `systemctl enable serviço/socket`
- `systemctl disable serviço/socket`

---
**Systemd-free**
Systemd-free é um movimento que é contra o uso do systemd por não seguir filosofia Unix. O movimento recomenda outras alternativas, como Runit, OpenRC e Dunit.

**Runit**
O runit é um init e supervisão de serviços, desenhado para ser um substituto direto do sysvinit. Ele é otimizado para confiabilidade e tamanho reduzido, de modo que a quantidade de código rodando no processo PID 1 seja a mínima possível.

**Comandos básicos:**
- `sv start serviço`
- `sv stop serviço`

---
**Comparativo de camadas de atuação:**
| Camada / Função | systemd | runit |
|-----------------|---------|-------|
| Init / boot | Sim | Sim |
| Gerenciamento de serviços | Sim | Sim |
| Logs | Sim | Não |
| Rede | Sim | Não |
| Resolução de nomes | Sim | Não |
| Sincronização de tempo | Sim | Não |
| Login de usuário | Sim | Não |
| Contêineres | Sim | Não |
| Filosofia Unix | Não | Sim |

---
## Sistemas de Arquivos
Um sistema de arquivos (ou filesystem) é uma forma de organização de dados em um meio de armazenamento em massa, como HDs. SSDs e pendrives.

**ext4:**
O ext4 é uma evolução avançada do sistema de arquivos ext3, focado em melhorias de escalabilidade e confiabilidade para suportar grandes sistemas de arquivos (64 bits
- Desempenho e Estrutura: Introduziu extents, reduzindo sobrecarga de metadados e aumentando a resistência a corrupções; além disso, o ext4 suporta sistemas de arquivos >16 TB, alocação de múltiplos blocos simultâneos e alocação atrasada.

---
- Segurança e Recursos: suporte a criptografia baseada em arquivos (fscrypt) e somas de verificação (checksums) no journal para detecção de corrupções.

- Modos de Dados: writeback (o mais rápido), ordered (agrupa logicamente metadados com as alterações de dados) e journal ( mais lento).

**BTRFS:**
O BTRFS é um sistema de arquivos copy-on-write (COW) voltado para a implementação de recursos avançados, com grande foco em tolerância a falhas, reparo e facilidade de administração.

---
- Gerenciamento Avançado: Destaca-se pelo suporte a Subvolumes e Snapshots de leitura e gravação.

- Tolerância a Falhas e Reparo: O BTRFS possui suporte nativo a RAID via software e um recurso de autocura. Ele utiliza somas de verificação para os dados e os metadados, o que permite a detecção automática de corrupções silenciosas de dados e a sua posterior correção em segundo plano, através de um processo chamado scrub, usando cópias redundantes.

- Capacidade e Otimização: O sistema pode suportar arquivos de até 16 EiB, oferece compressão de dados transparente e permite a desfragmentação online do sistema de arquivos. Além disso, ele é recomendado para SSDs.

---
## Gerenciamento de Processos
Um processo é, essencialmente, a representação de um programa em execução que utiliza os recursos do computador para realizar uma tarefa. Em sistemas Linux, um único processador é compartilhado entre vários processos através de algoritmos de agendamento que determinam quando pausar um processo e servir outro.

**Hierarquia:**
O Linux baseia-se em uma hierarquia onde um processo é capaz de criar outros processos, assumindo o papel de "pai". O primeiro processo a ser criado durante a inicialização do sistema é o init, que atua como o pai de todos os outros processos.

---
**Estados de um Processo:**
Durante seu ciclo de vida, um processo pode transitar entre quatro estados principais

- Execução (Executável): O processo está ativo.

- Pronto/Espera (Dormente): O processo está aguardando alguma rotina ou temporariamente parado, permitindo que outro processo seja executado na sua frente.

- Bloqueado/Parado: O processo está congelado e, por algum motivo, não pode ser executado no momento.

- Zumbi (Morto): O processo já foi finalizado e não está mais em execução.

---
**Comandos de Monitoramento:**
Para verificar e gerenciar processos, existem comandos nativos essenciais

- ps: Lista os processos em execução.

- top: Acompanha a execução dos processos, atualizando os dados quase em tempo real.

**Sinais e Controle de Trabalhos:**
O sistema interfere no funcionamento dos processos enviando sinais.

- KILL (-9): Força o encerramento imediato de um processo.
- TERM: Solicita que o processo termine pacificamente após concluir uma tarefa.
- STOP: Interrompe (pausa) temporariamente a execução.
- CONT: Reativa um processo que havia sido interrompido.

---
## Comandos úteis

### Processos
| Comando | Descrição |
|-----------|-----------|
| `ps` | Lista processos em execução |
| `top` | Monitora processos em tempo real |
| `kill` | Termina processos por ID |
| `killall` | Termina processos por nome |
| `pkill` | Termina processos por padrão |
| `pgrep` | Busca processos por padrão |
| `sleep` | Pausa execução por tempo especificado |

---
### Usuários/Permissões
| Comando | Descrição |
|-----------|-----------|
| `chmod` | Altera permissões de arquivos |
| `chown` | Altera dono de arquivos |
| `whoami` | Exibe usuário atual |
| `groups` | Lista grupos do usuário |
| `users` | Lista usuários logados |
| `id -nG` | Exibe grupos do usuário |
| `getent group` | Lista grupos do sistema |
| `passwd` | Muda senha do usuário |
| `chsh` | Altera shell do usuário |
| `usermod -aG` | Adiciona usuário a grupo |
| `newgrp` | Muda para outro grupo |

---
### Hardware/Sistema
| Comando | Descrição |
|-----------|-----------|
| `free` | Exibe uso de memória |
| `df` | Exibe espaço em disco |
| `pkexec` | Executa comando como outro usuário |
| `locale` | Exibe configurações de localização |
| `env` | Exibe variáveis de ambiente |

---
## Referencias
- [runit](https://wiki.artixlinux.org/Main/Runit)
- [Systemd ](https://systemd.io/)
- [Começando com o Linux Comandos, serviços e administração](https://www.casadocodigo.com.br/products/livro-linux)
- [Guia Pratico do servidor Linux](https://www.casadocodigo.com.br/products/livro-admin-linux)
- [BTRFS](http://smarden.org/runit/)
- [GNU Coreutils](https://www.gnu.org/software/coreutils/manual/coreutils.pdf)
- [ext4 General Information](https://docs.kernel.org/admin-guide/ext4.html)


---
<!-- _paginate: skip -->

![bg fit ](../../imgs/fim.png)
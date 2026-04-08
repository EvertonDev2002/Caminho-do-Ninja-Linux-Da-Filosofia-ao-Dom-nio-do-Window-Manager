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
Linux é multiusuário com permissões rigorosas para controlar acesso.

**Categorias:** `u` (usuário), `g` (grupo), `o` (outros), `a` (todos)  
**Níveis:** `r` (leitura), `w` (escrita), `x` (execução), `s` (setuid/setgid)

**chmod - Notação Simbólica:**  
`chmod u+x arquivo` | Adiciona execução  
`chmod g-w arquivo` | Remove escrita do grupo  
`chmod a=r arquivo` | Define leitura para todos

**chmod - Notação Octal:**  
`4` = leitura | `2` = escrita | `1` = execução  
`chmod 755 arquivo` = `rwx` dono, `r-x` grupo/outros  
`chmod 644 arquivo` = `rw-` dono, `r--` grupo/outros

---
**chown & chgrp:**
```bash
chown novo_dono arquivo           # Alterar dono
chown dono:grupo arquivo          # Alterar dono e grupo
chgrp novo_grupo arquivo          # Alterar apenas grupo
```

---
## Systemd e systemd-free
**Systemd:** Gerenciador de sistema e serviços com paralelização agressiva, ativação por socket e D-Bus.
- `systemctl start/stop/enable/disable serviço`

**Sistemd-free:** Movimento que questiona filosofia Unix do systemd. Alterna: Runit, OpenRC, Dunit.

**Runit:** Init e supervisão de serviços otimizado para confiabilidade e tamanho reduzido.
- `sv start/stop serviço`

**Comparativo:**
| Função | systemd | runit |
|--------|---------|-------|
| Init/boot | Sim | Sim |
| Gerenc. serviços | Sim | Sim |
| Logs/Rede/Tempo | Sim | Não |
| Filosofia Unix | Não | Sim |

---
## Sistemas de Arquivos
Organização de dados em mídia de armazenamento (HDs, SSDs, pendrives).

**ext4:** Evolução do ext3 com melhorias em escalabilidade e confiabilidade.
- Suporta arquivos >16 TB, extents, alocação múltipla de blocos
- Criptografia por arquivo (fscrypt), checksums no journal
- Modos: writeback, ordered, journal

**BTRFS:** Copy-on-write com foco em tolerância a falhas e administração.
- Subvolumes e Snapshots (R/W)
- RAID por software, autocura, detecção de corrupções
- Suporta arquivos até 16 EiB, compressão transparente
- Recomendado para SSDs

---
## Gerenciamento de Processos
Processo: Representação de programa em execução que utiliza recursos do computador.

**Hierarquia:** Linux usa hierarquia de processos onde um processo "pai" cria outros. Init é o primeiro processo (PID 1).

---
**Estados:** 
- **Execução (Executável):** Ativo
- **Pronto (Dormente):** Aguardando
- **Bloqueado (Parado):** Congelado, não pode executar
- **Zumbi (Morto):** Finalizado, não está mais em execução

**Sinais de Controle:**
- `KILL (-9)` - Força encerramento imediato
- `TERM` - Solicita encerramento pacífico
- `STOP` - Interrompe temporariamente
- `CONT` - Reativa processo interrompido

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
![bg left:35%](../../imgs/common/nana-question.png)
**Tarefa: Configurar uma aplicação segura que inicia com o sistema e monitorar seu estado**
- Crie um script simples em seu /home, mude o dono para seu usuário com chown e defina a permissão octal como 700 (apenas você lê, escreve e executa).

- Crie uma unidade de serviço no systemd (em /etc/systemd/system/) para rodar esse script.

---
![bg left:35%](../../imgs/common/nana-question.png)

- Use systemctl start e systemctl status para validar se o serviço está ativo.

- Abra o top ou htop e identifique o PID do seu processo, observando o consumo de CPU e o estado (Execução ou Espera).

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

![bg fit ](../../imgs/common/fim.png)
---
marp: true
paginate: true
lang: pt-BR
---
![bg right 80%](../../imgs/05-aula/hyprland.png)
![bg 80%](../../imgs/05-aula/wayland-icon.png)


# Redes e Interfaces Gráficas

---
**Sumário**
- Gerenciamento de Rede
- Interfaces Gráficas (DE)
- Compositor (XORG e WAYLAND)
- Windows Manager (i3, SWAY, River, niro)

---
## Gerenciamento de Rede
O gerenciamento de rede no Linux envolve a configuração de interfaces, endereçamento IP, roteamento de pacotes e resolução de nomes utilizando a pilha de protocolos TCP/IP.

**Interfaces de Rede:**
- eth0 ou enp0s3 para conexões cabeadas (Ethernet).

- wlan0 para redes sem fio (wireless).

- lo para a interface lógica de loopback (localhost)

---
**Configuração Dinâmica e Estática:**
- Configuração Dinâmica: É temporária e se perde quando o sistema é reiniciado. 

- Configuração Estática: É permanente e se mantém após a reinicialização.

**Resolução de Nomes (DNS):** Para configurar qual servidor DNS o Linux utilizará, edita-se o arquivo `/etc/resolv.conf`.
**Gerenciamento de Nomes de Máquina (Hostname):** O arquivo `/etc/hosts` é utilizado para mapear endereços IP a nomes de máquinas. Para alterar o nome do próprio servidor dinamicamente para sessão atual usa-se o comando `hostname <novo-nome>`, ou edita-se o arquivo `/etc/hostname` para tornar a alteração estática e permanente.

---
## Interfaces Gráficas
No Linux, a interface gráfica atua como uma camada adicional do sistema operacional que permite ao usuário interagir de forma visual através de um gerenciador de janelas.

Uma característica fundamental do Linux é que ele é totalmente independente de um servidor gráfico para funcionar

**Ambientes de Desktop:**
- GNOME: Um dos mais populares, possui foco em usabilidade moderna.
- KDE (Plasma): Muito conhecido por sua imensa capacidade de customização e ferramentas integradas.
- Xfce: Um ambiente de desktop leve, ideal para computadores com menos recursos.

---
## Compositor
A arquitetura gráfica no Linux passou por uma evolução do tradicional X11 (Xorg) para o protocolo Wayland.

**Xorg:** No modelo do X11, o servidor X atua como um intermediário constante entre o hardware (kernel), os clientes e o compositor.
- Entrada: O kernel recebe o evento do dispositivo de entrada e o encaminha ao servidor X via driver evdev.

- Distribuição: O servidor X tenta identificar qual janela foi afetada e repassa o evento ao cliente, porém frequentemente desconhece a posição real da janela, pois ela pode ter sido transformada pelo compositor.

---
- Requisição: O cliente processa o evento e devolve uma requisição de renderização ao servidor X.

- Evento de Dano: O servidor X processa a requisição, calcula a região alterada e notifica o compositor com um evento de dano.

- Composição e Exibição: O compositor recompõe a tela inteira e devolve a imagem ao servidor X, que por fim a copia para o hardware, processo redundante e ineficiente.

---
**Wayland:** O Wayland foi criado para substituir a arquitetura e o protocolo do X11, tornando o sistema mais fácil de desenvolver e manter. O compositor é o próprio servidor de exibição.

- Entrada Direta: O kernel capta o evento de hardware e o repassa imediatamente ao compositor Wayland.

- Mapeamento Exato: O compositor, por controlar todo o grafo de cena e as transformações visuais, sabe precisamente para qual cliente enviar o evento e converte as coordenadas da tela para as coordenadas locais da janela.

- Renderização Direta: Ao contrário do X11, o cliente renderiza sua interface diretamente em um buffer de memória compartilhado com o compositor, usando bibliotecas como OpenGL/EGL.

---

- Composição: Após atualizar o buffer, o cliente notifica o compositor apenas sobre a área modificada por meio de uma requisição de dano

- Exibição: O compositor reúne as requisições, recompõe a tela via EGL/GLES2 ou hardware (overlays) e envia a imagem final ao kernel via KMS para exibição.

---
## Windows Manager
Os Gerenciadores de Janelas (WMs) são softwares responsáveis por controlar posicionamento, aparência e comportamento das janelas, incluindo bordas, barras de título e redimensionamento.

**Windows Manager:**
- Stacking (ou Floating): Oferecem a metáfora tradicional de "papéis em uma mesa", onde as janelas flutuam e podem se sobrepor umas às outras (como no Windows e macOS).

- Tiling: Organiza as janelas lado a lado em um formato de "mosaico" ou "azulejo", garantindo que não haja sobreposição.

- Dynamic: Permite alternar de forma dinâmica entre os esquemas em tiling e flutuante.


---
## Comandos úteis

**Rede:**
| Comando | Descrição |
|-----------|-----------|
| `ip` | Configura e exibe interfaces de rede |
| `ping` | Testa conectividade com hosts remotos |
| `nmcli` | Gerencia conexões de rede |

---
**Informação:**
| Comando | Descrição |
|-----------|-----------|
| `uptime` | Exibe tempo de atividade do sistema |
| `pinky` | Exibe informações sobre usuários logados |

---
## Referencias
- [Major Differences between Wayland and Xorg Server](https://infotechys.com/major-differences-between-wayland-and-xorg/)
- [Window manager](https://wiki.archlinux.org/title/Window_manager)
- [A estrutura de diretórios Linux ](https://www.linuxando.com/tutorial.php?t=A%20estrutura%20de%20diret%C3%B3rios%20Linux_6)
- [Começando com o Linux Comandos, serviços e administração](https://www.casadocodigo.com.br/products/livro-linux)
- [Guia Pratico do servidor Linux](https://www.casadocodigo.com.br/products/livro-admin-linux)
- [Wayland Architecture](https://wayland.freedesktop.org/architecture.html)
- [An Introduction to the UNIX Shell](https://www.di.ubi.pt/~crocker/prog3/unix_c_internets/sh.pdf)
- [X.Org Server](https://en.wikipedia.org/wiki/X.Org_Server)

---
<!-- _paginate: skip -->

![bg fit ](../../imgs/fim.png)
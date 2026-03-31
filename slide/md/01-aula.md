---
marp: true
paginate: true
lang: pt-BR

---
![bg right 80%](../../imgs/01-aula/Heckert_GNU.svg.png)
![bg 80%](../../imgs/01-aula/Tux.svg.png)

# A Jornada do Sistema Operacional e a Filosofia Livre

---
**Sumário**
- História e Fundamentos
- Filosofia Open Source
- Filosofia Free Software
- O conceito GNU/LINUX
- Distribuição Linux

---
## História e Fundamentos

O Unix surgiu como contraponto ao sistema operacional (S.O) MULTICS em 1969, pela equipe de pesquisadores Bell Labs (Ken Thompson, Dennis Ritchie, Doug McIlroy e Joe Ossanna). Originalmente foi batizado como UNICS (um trocadilho com MULTICS) por Brian Kernighan. Sua primeira versão era escrito em assembly, mais tarde, em 1973, o Unix foi reescrito na linguagem C.

---
**Resumo:**
- O UNIX surgiu em 1960 escrito em assembly
- No ano de 1973 foi reescrito em C
  - uma revolução para época
  - tornou desenvolvimento de S.O mais simples
  - S.O tornou mais portável

---
## Filosofia Unix
Durante a década de 1970, a AT&T licenciou os códigos-fonte do Unix para universidades e institutos de pesquisa, o que gerou diversas variantes e um enorme crescimento do sistema, com destaque para a versão BSD (Berkeley Software Distribution), desenvolvida na Universidade da Califórnia.

---
**Princípios Filosofia Unix:**
No total são 17 regras, mas veremos somente algumas.
- **Regra da Modularidade:**
screva partes simples conectadas por interfaces limpas. Manter a complexidade baixa em módulos separados garante que problemas sejam locais, permitindo atualizar uma peça sem quebrar o todo

- **Regra da Clareza:**
A clareza do código é melhor do que a inteligência exagerada. Como a manutenção é custosa, o código deve ser legível para o desenvolvedor que o manterá no futuro, e não apenas para a máquina.

--- 
- **Regra da Composição:**
Projete programas para estarem conectados com outros. Os programas devem preferencialmente aceitar e emitir fluxos de texto simples para facilitar essa integração.
- **Regra da Separação:**
Separe a política do mecanismo e separe as interfaces das engines (o frontend implementa a política, e o backend, o mecanismo).

---
- **Regra da Simplicidade:**
Projete visando a simplicidade e adicione complexidade apenas quando for estritamente necessário, resistindo ao inchaço do software.
- **Regra da Parcimônia:**
Escreva programas grandes apenas quando puder ser demonstrado claramente que nenhuma outra abordagem menor servirá

---
- **Regra do Silêncio:**
Quando um programa não tem nada de surpreendente ou de erro a relatar, ele não deve dizer nada. A saída de um programa precisa poder virar facilmente a entrada de outro.
- **Regra do Reparo:**
Quando não for possível lidar com um erro de forma elegante e o programa precisar falhar, ele deve falhar ruidosamente e o mais rápido possível para facilitar o diagnóstico

---
![bg right 65%](../../imgs/01-aula/Richard-Stallman.jpg)

## Projeto GNU (GNU is Not Unix)
Na década de 1980, o Unix já havia se tornado grande e reconhecido, mas sua licença era cara (US$ 20.000 a época) e restritiva. Por conta de tais característica, Richard Stallman, em 1983, criou o projeto GNU com intuito de desenvolver um S.O. completo, livre e que fosse totalmente compatível com o Unix.

---
![bg right 65%](../../imgs/01-aula/Linus-Torvalds.jpg)
## Kernel Linux
Linus Torvalds, em 1991, inspirado no MINIX desenvolvida por Andrew Tanenbaum, desenvolveu o próprio kernel, o qual nomeou como Linux. Pouco tempo depois (um ano), Torvalds licenciou (GNU GPL) como software livre, isso permitiu a união com GNU que gerou o GNU/Linux.

---
![bg 85%](../../imgs/01-aula/linha-do-tempo-unix-ao-linux.png)

--- 
## Filosofia Open Source (código aberto)
Software de código aberto é um código desenvolvido para ser acessível ao público: qualquer pessoa pode ver, modificar e distribuir o código da maneira que achar melhor.

**Princípios:**
- Revisão por pares
- Transparência
- Confiabilidade
- Flexibilidade
- Colaboração aberta

---
## Filosofia free software (Software livre)
O software livre é aquele que respeita a liberdade e o senso de comunidade dos usuários, garantindo o direito de executar, copiar, distribuir, estudar, mudar e melhorar o programa.

---
**As quatro liberdades essenciais:**
- liberdade 0: A liberdade de executar o programa como você desejar, para qualquer propósito.
- liberdade 1: A liberdade de estudar como o programa funciona, e adaptá-lo às suas necessidades.
- liberdade 2: A liberdade de redistribuir cópias de modo que você possa ajudar outros
- liberdade 3: A liberdade de distribuir cópias de suas versões modificadas a outros.

---
## GNU/Linux
Ao juntar os utilitários, bibliotecas e a interface em modo texto (shell) do projeto GNU com o kernel Linux que gerencia a máquina, obteve-se o sistema operacional plenamente funcional conhecido como GNU/Linux

---
## Distribuição Linux
Uma Distribuição Linux (distro) é um sistema operacional completo criado a partir de um conjunto de softwares que operam em conjunto com o núcleo (kernel) Linux, utilitários e bibliotecas (GNU), gerenciador de pacotes e repositórios.

As distros mais antigas ainda ativas são o Slackware (1993) e o Debian (1993), este último é base para grandes S.O. populares, como Ubuntu e Linux Mint.

---
## Comandos úteis

| Comando | Descrição |
|-----------|-----------|
| `uname` | Exibe informações do Kernel e sistema operacional |
| `cat /etc/os-release` | Para verificar qual distribuição está rodando e sua base |

---
## Referencias
- [Volnys & Midorikawa (c) 1
Introdução ao Sistema UNIX](https://www.lsi.usp.br/~volnys/courses/linux/pdf-col/unix-col.pdf)
- [History of Unix](https://en.wikipedia.org/wiki/History_of_Unix) 
- [Uma breve história do UNIX, LINUX e Software Livre](https://wiki.inf.ufpr.br/maziero/doku.php?id=unix:historico_do_unix_e_linux)
- [Contrato Social Debian](https://www.debian.org/social_contract.pt.html)
- [O que é o software livre?](https://www.gnu.org/philosophy/free-sw.pt-br.html)
- [A filosofia Unix](https://www.tabnews.com.br/rafael/a-filosofia-unix)
- [The Art of Unix Programming](http://www.catb.org/esr/writings/taoup/html/)
- [Guia Pratico do servidor Linux ](https://www.casadocodigo.com.br/products/livro-admin-linux)
- [What is open source?](https://www.redhat.com/en/topics/open-source/what-is-open-source)

---
<!-- _paginate: skip -->

![bg fit ](../../imgs/fim.png)
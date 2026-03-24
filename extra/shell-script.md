---
marp: true
paginate: true
lang: pt-BR

---
## Script Bash
### Programando em Shell Script
- Cabeçalho (Shebang): O arquivo de script sempre deve iniciar com `#!/bin/bash` na primeira linha.
- Permissões: O script requer permissão de execução no sistema de arquivos para funcionar, o que é conferido pelo comando `chmod +x` ou `chmod 777`.

---

- Comentários: O caractere `#` em qualquer lugar que não seja a primeira linha serve como comentário.
- Interação com Usuário: O comando `read variavel` interrompe o script e espera uma inserção de dados do teclado, salvando na variável logo em seguida.
- Sintaxe de comandos: Comandos simples são formados por palavras separadas por espaços, onde a primeira palavra é o nome do programa a ser executado, e as demais são os parâmetros e argumentos.

---
- Execução em segundo plano: Ao adicionar o operador `&` ao final de um comando.

- Curingas: 
  - `*` corresponde a qualquer conjunto de caracteres, incluindo nenhum.
  - `?` corresponde a um único caractere.
  - `[]` corresponde a uma lista ou intervalo de caracteres limitados.
  - `!` permite negar/excluir a operação sobre uma faixa.

---
### Variáveis e Substituições
- Declaração: Variáveis não exigem definição de tipo e são atribuídas diretamente usando o sinal de igual sem espaços (`nome=valor`).
- Acesso: O conteúdo da variável é substituído e lido colocando-se o cifrão na frente de seu nome (`$nome` ou `${nome}`).
- Substituição de Comando: É possível armazenar a saída de um comando inteiro dentro de uma variável isolando-o entre crases 
```bash 
`comando` 
# ou utilizando a sintaxe
$(comando) 
```  
---
### Variáveis Especiais
- `$?` Retorna o status de saída do último comando executado (onde 0 geralmente significa sucesso e valor maior que zero é falha).
- `$#` Contém o número total de parâmetros posicionais passados no script.
- `$1, $2, ...` Representam os parâmetros (argumentos) recebidos na invocação do script.
- `$$` Fornece o número do processo (PID) do shell atual.

---
### Regras de Citação
- A contrabarra `\` cega o metacaractere seguinte, transformando-o em um caractere de texto comum e tirando seu poder de processamento.
- As aspas simples `' '` englobam o conteúdo e não expande.
- As aspas duplas `" "` agrupam palavras e expande.

---
### Estruturas de Controle de Fluxo
If Simples
```bash
if [[condição]];
 # ação
fi
```
If com Else
```bash
if [[condição]];
 # ação
else
 # ação
fi
```

---
### Exemplo

```bash
# Verificar se um arquivo existe
if [[ -f "/etc/passwd" ]]; then
  echo "Arquivo /etc/passwd existe"
fi
```

```bash
# Validar entrada do usuário
idade=15
if [[ $idade -ge 18 ]]; then
  echo "Você é maior de idade"
else
  echo "Você é menor de idade"
fi
```

---
If com Else
```bash
if [[ condição ]]; then
  # ação
elif [[ condição ]]; then
  # ação
else
  # ação
fi
```

---
### Exemplo

```bash
# Classificar nota
nota=75
if [[ $nota -ge 90 ]]; then
  echo "Conceito: A"
elif [[ $nota -ge 80 ]]; then
  echo "Conceito: B"
elif [[ $nota -ge 70 ]]; then
  echo "Conceito: C"
else
  echo "Conceito: D (Reprovado)"
fi
```

---
### Operadores de Comparação e Testes

| Operador | Descrição | Exemplo |
|----------|-----------|---------|
| -eq | Igual (números) | `[[ $a -eq 10 ]]` |
| -ne | Não igual (números) | `[[ $a -ne 10 ]]` |
| -lt | Menor que | `[[ $a -lt 20 ]]` |
| -le | Menor ou igual | `[[ $a -le 20 ]]` |
| -gt | Maior que | `[[ $a -gt 5 ]]` |
| -ge | Maior ou igual | `[[ $a -ge 5 ]]` |
| == | Igual (strings) | `[[ $nome == "João" ]]` |

---
| Operador | Descrição | Exemplo |
|----------|-----------|---------|
| != | Não igual (strings) | `[[ $nome != "João" ]]` |
| -z | String vazia | `[[ -z $variavel ]]` |
| -n | String não vazia | `[[ -n $variavel ]]` |
| -f | Arquivo existe | `[[ -f "/caminho/arquivo" ]]` |
| -d | Diretório existe | `[[ -d "/caminho/dir" ]]` |
| -r | Arquivo é legível | `[[ -r "/caminho/arquivo" ]]` |
| -w | Arquivo é gravável | `[[ -w "/caminho/arquivo" ]]` |
| -x | Arquivo é executável | `[[ -x "/caminho/arquivo" ]]` |

---
### Estruturas de Controle Avançadas
Case
```bash
case $variavel in
  padrão1)
    # ação executada se variável corresponder ao padrão1
    ;;
  padrão2)
    # ação executada se variável corresponder ao padrão2
    ;;
  *)
    # ação padrão se nenhum padrão anterior corresponder
    ;;
esac
```

---
### Exemplo
```bash
read -p "Deseja continuar? (s/n): " resposta
case $resposta in
  s|S|sim|Sim)
    echo "Continuando..."
    ;;
  n|N|não|Não)
    echo "Encerrando..."
    exit 0
    ;;
  *)
    echo "Resposta inválida"
    ;;
esac
```

---
For
```bash
for variável in lista_de_valores; do
  # comandos executados para cada valor da lista
done
```
### Exemplo
```bash
# Loop com range (sequência)
for i in {1..10}; do
  echo "Iteração $i"
done
```

---
```bash
while [[ condição ]]; do
  # comandos executados enquanto a condição for verdadeira
done
```
### Exemplo
```bash
# Contar até 5
contador=1
while [[ $contador -le 5 ]]; do
  echo "Contagem: $contador"
  contador=$((contador + 1))
done
```

---
### Função
```bash
nome_funcao() {
  # comandos executados quando a função é chamada
}

# Chamar a função
nome_funcao
```
### Exemplo
```bash
somar() {
  local resultado=$((( $1 + $2 )))
  return $resultado
}

somar 5 3
echo "Resultado: $?" 
```

---
### Redirecionamento e Pipe

- Redirecionamento de Saída
  - `>`: Grava a saída em um arquivo (sobrescreve).
  - `>>`: Adiciona a saída ao final de um arquivo existente.
- Redirecionamento de Entrada
  - `<`: Lê dados de um arquivo em vez do teclado.
  - `<< palavra `: Adiciona a saída ao final de um arquivo existente.
- Pipes: 
  - `|`: Envia a saída de um comando como entrada para o próximo
# Produtor consumidor 

## Descrição do problema
O problema do produtor consumidor é um problema clássico de sincronização de processos. O problema consiste em um buffer de tamanho finito, onde um ou mais produtores colocam itens no buffer e um ou mais consumidores retiram itens do buffer. O problema é que o buffer tem um tamanho finito, então se o buffer estiver cheio, o produtor deve esperar até que um consumidor retire um item do buffer, e se o buffer estiver vazio, o consumidor deve esperar até que um produtor coloque um item no buffer.

## Principais desafios
Fazer a comunicação dos dados entre os processos e manter a integridade dos dados no buffer.

## Descrição e apresentação do algoritmo
O algoritmo foi implementado na linguagem [Erlang](https://www.erlang.org/). 

Ele conta com oito processos diferentes rodando, sendo eles:
- **main**: Responsável por iniciar os processos de produtor e consumidor.
- **2 produtores**: Responsável por produzir os itens e colocá-los no buffer.
- **4 consumidor**: Responsável por consumir os itens do buffer.
- **1 buffer**: Responsável por armazenar os itens produzidos.

O produtor gera números aleatórios para definir o tempo de espera até gerar o próximo. Ele vai gerar 0 ou 1. Caso o valor seja 1 o tempo de espera vai ser 3500 (3,5 segundos), caso seja 0, o valor de espera vai ser 7000 (7 segundos).

O buffer é responsável por criar uma fila, que, seguindo o conceito de FIFO (First in first out), remove sempre o primeiro item da lista.

Quando o buffer recebe o valor produzido, armazena esse valor nessa fila. 

O consumidor é responsável por retirar o primeiro valor da fila e printar ele no console. Após consumir esse item, o consumidor vai dormir pelo valor consumido (3500 ou 7000) vezes dois (consumido * 2).

## Relato com a linguagem
Por se tratar de uma linguagem funcional, a implementação do algoritmo foi mais simples do que em outras linguagens.

Esse trabalho mostrou o poder da lingugagem em trabalhar com processos de forma concorrente e paralela, o que facilitou a implementação do algoritmo.

## Exemplo de aplicação
O exemplo que eu acho mais fácil é de mensageria entre microserviços. Pesquisando sobre o problema, me deparei em algoritmos que implementavam um load balancer junto ao buffer. 

Uma ferramenta muito utilizada que é baseada nesse problema é o [RabbitMQ](https://github.com/rabbitmq), que é um software de mensageria amplamente utilizado no mercado.

### Como executar o código fonte
Para executar o código fonte, é necessário ter o Erlang instalado na máquina.

Gerar o BEAM:
```shell
erlc -o beam buffer.erl producer.erl main.erl consumer.erl
```

Entrar no shell do Erlang (dentro do diretório do projeto):
```shell
erl -pa ./beam
```

Executar o código:
```shell
main:main().
```
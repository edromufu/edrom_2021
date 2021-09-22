# Documentação Motor Comm

O pacote Motor Comm é o responsável pela comunicação de motor, tratando e enviando os dados, além de fazer uma abstração do tipo de driver utilizado: openCm, mojitaba ou gazebo, para um padrão geral. Para os demais nodes do movimento, não se é necessário entender a implementação do Motor Comm, apenas entender como as mensagens são trocadas. Esse documento serve para especificar os campos e possíveis valores que devem ser enviados para utilizar o Motor Comm.

### Tópicos

Os tópicos utilizados pelo Motor Comm são:

```
/motor_comm/request
/motor_comm/response
```

O tópico `request` é utilizado para solicitar comandos para o Motor Comm e o `response` retorna a resposta, quando pertinente.

#### Request

O tópico do `request` utiliza uma mensagem do tipo `movement_msgs::MotorRequestMsg`, cujos campos são:

###### source

Informa a fonte do comando a ser executado, essa informação é utilizada pelo Motor Comm para o controle de prioridade das mensagens, esse campo pode assumir os seguintes valores:

- walking 

    Envolve comandos de passo e stand still da robô.

- movecreator

    Envolve comandos da execução de uma page, utilizada em movimentos como chutar e levantar.

- shutdown

    São os comandos que solicitam o desligamento e religamento dos motores, utilizados quando a robô está caindo.

- head

    Comandos de movimento da cabeça, utilizados para procurar e centralizar objetos da visão.

###### writeCommand

É o tipo de comando de escrita nos motores a ser executado, caso não queira executar nenhuma escrita, deixar a string vazia. Os comandos atualmente suportados são:

- position_dt

    É o comando mais utilizado, pede para chegar na posição especificada no intervalo de tempo em que o Motor Comm utiliza, esse intervalo fica especificado dentro do node e é usualmente 0.07 segundos.

- position_const

    Nesse comando, a posição enviada será executada usando uma velocidade constante para todos os motores, a velocidade fica determinada dentro do Motor Comm, mas usualmente é de 0.3 rad/s.

- position_velocity

    Nesse comando, é enviado um vetor de posição e um de velocidade para ser executado pelos motores.

- torque

    É enviado um vetor de 0 e 1 para o Motor Comm, sendo 0 requisitando o motor para desligar o torque e 1, para ligá-lo.

###### data

Esse é o vetor que vai receber os dados a serem escritos no motor, quando a informação é de posição, deve ser enviado as posições dos motores em radianos - o indice do vetor indicando o id do motor a que se refere a informação, em todos os casos. Para torque, o vetor consiste em zeros e uns, indicando o estado do torque a ser escrito no motor.

###### velocity

Esse vetor é somente utilizado para o comando `position_velocity`, nele será informado a velocidade que deseja enviar para cada motor, em rad/s.

###### readCommand

É o comando utilizado para solicitar uma leitura no motor, a resposta da leitura será enviado pelo tópico do `response`. Os tipos de leitura atualmente suportados são:

- position
- velocity
- current
- motor_ids

#### Response

Nesse tópico são publicadas as respostas dos motores, ele utiliza mensagens do tipo `movement_msgs::MotorResponseMsg`, cujos campos são:

##### readCommand

Aqui será escrito o tipo de leitura que foi requisitado, os valores possíveis são os mesmos desse campo `request`.

##### data

Nesse campo será enviado um vetor com a resposta do Motor Comm, as unidades das respostas são:

- position

    Resposta em radianos

- velocity

    Resposta em rad/s

- current

    Resposta em mA

- motor_ids

    A resposta consiste nos ids dos motores em ordem crescente

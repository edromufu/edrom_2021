#!/usr/bin/env python
import rospy
from list_of_possible_movements import PossibleMovementsList
from webots_ros.srv import set_string

class CheckerPossibilities():
    """
    Description :

        Classe que conecta as interações entre o movimento e o behaviour. Tem como finalidade
        listar se é possivel uma determinada requisição ser aprovada com base nas 
        possibilidades de movimento disponiveis.
    """

    def __init__(self)  -> None:
        """
        Contrutor que instancia um objeto da classe {PossibleMovementsList}, que acessará a 
        lista de movimentos possiveis definidas do movimento.
        """

        self.string_from_hebaviour = ''
        self.lpm = PossibleMovementsList()
    
    def server(self):
        """
        Description: 

            Criação e inicialização do server que recebe as requisições do behaviour. Neste
            metodo também é iniciado o node, em conjunto com seu respectivo 
        """

        rospy.init_node('server')
        _server = rospy.Service('/movement_test', set_string, self.get_requisition_from_behaviour)
        print ("Esperando Solicitação")
        rospy.spin()

    def get_requisition_from_behaviour(self, req):
        """
        Description: 

            Criação e inicialização do server que recebe as requisições do behaviour. Neste
            metodo também é iniciado o node, em conjunto com seu respectivo 

        Args: 

            req {string} : É uma string que representa uma requisição do behaviour

        Return:

            booleano : Quando movimento requisitado existe, é retornado true. Caso não exista 
                       é retornado false 
        """

        self.string_from_hebaviour = req.value
        print('Nome da Solicitção : ', self.string_from_hebaviour)

        if (self.lpm.is_movement_listed(self.string_from_hebaviour)):
            print('Feedback : (', str( self.string_from_hebaviour), ') corresponde a lista de movimentos possiveis ')

        else:
            print('Feedback : (', str( self.string_from_hebaviour), ') NÂO corresponde a lista de movimentos possiveis ')
            self.feedback_possibilities_to_behaviour('Comando nao existe')

        return (self.lpm.is_movement_listed(self.string_from_hebaviour))

    def feedback_possibilities_to_behaviour(self, situation_requisition):
        """
        Description: 

           Tem como finalidade dar o feedback da existencia ou nao do movimento requisitado 

        Args: 

            situation_requisition {string} : É uma string que diz se o movimento existe ou nao
        """

        try:
            _service_feedback = rospy.ServiceProxy('behaviour_topic_name', set_string)

            _service_feedback(situation_requisition)
        except:
            print("O Service não foi criado")


if __name__ == "__main__":
    checker = CheckerPossibilities()
    checker.server()

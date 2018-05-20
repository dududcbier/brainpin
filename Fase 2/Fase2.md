### Plataforma Escolhida
Decidimos implementar nosso código em Ruby on Rails junto ao Postgres e o MongoDB.
Para fazer a interação entre o Rails e o MongoDB foi usada a gema Mongoid, 
que facilita bastante o acesso aos dados. Além disso, criamos um container
no Docker para que a execução do código em diferentes máquinas fosse simples.

### Rodando o código
As instruções para rodar o código podem ser encontradas em brainpin/README.md 

### Sobre as correções e outras mudanças feitas no modelo

 A seguir serão listadas as mudanças que fizemos no banco, seja para atender a 
 uma correção apontada pela monitora, ou para melhorar algum aspecto do banco.

 - Os esquemas relacionais, fisicos e do noSQL foram passados para o inglês. 
   Isso foi feito porque o Rails tem convencões de nomes para os atributos e 
   para nomes de arquivo que ficam bastante estranhas quando aplicadas a um 
   código em português.

 - Conforme indicado pela correção, algumas entidades receberam novos atribu-
   tos para caracterizá-las melhor.

 - Foi adicionada a entidade nivel_ponto (levels_points) para que a quantidade
   de pontos necessárias para alcançar os niveis em um determinado 'estudavel'
   fosse representada no modelo.

 - Os avisos dos professores são considerados posts comuns e ficarão no BD noSQL.
   Um post de um professor poderá ser destacado simplesmente pelo fato de ser um
   professor.

 - Para que admins também conseguissem cadastrar questões, criamos a entidade 
   'cadastrador' (registrant)

 - Para diminuir a confusão entre Tema e Tópico, alteramos os nomes dessas enti-
   dades para tópico (topic) e subtópico (subtopic).

 - Ao passar para o modelo físico, criamos um atributo a mais em Sessão de Estudo 
   (Study_Session) para funcionar como chave primária. Isso foi feito porque o
   Rails não lida bem com chaves compostas e, em especial, chaves compostas usadas
   como chaves estrangeiras.

### Sobre o item 5

- Os exemplos de códigos de acesso aos bancos podem ser encontrados 
  em brainpin/controllers/db_example_controllers.rb.
- Para rodar os exemplos, basta acessar localhost:3000 depois de subir o Docker.
- Embora seja meio difícil de encontrar no console do Rails devido a
  grande quantidade de coisas que são impressas, os exemplos imprimem alguns re-
  sultados.
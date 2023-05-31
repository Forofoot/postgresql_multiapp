Erwan Marques M1TL,

Bonjour, dans le cadre du projet POSTGRESQL, j'ai décidé de créer une application s'appuyant sur le même principe que vinted avec un forum et une gallerie en plus.

L'application est composée de 4 schémas ( users_schema, products_schema, gallery_schema, forum_schema ). 

Un user à la possibilité de publier de nouveaux produits sur son mur, il a aussi la possibilité de publier des images dans sa gallerie, dialoguer avec d'autres utilisateurs sur le forum mais aussi dialoguer avec des vendeurs dans le cas où il souhaite acheter un produit.

Fonctionnalités :

    -   Lors de l'achat d'une commande effectuée par un utilisateur, une column counter sur sa table s'incrémente de 1 pour chaque commande effectuée.

    -   Après confirmation de commande, on viendra insérer dans une table ( MANY TO MANY ) "products_schema.ordered" l'id du produit ainsi que l'id de la commande reliée.

    -   Il est aussi possible en cas d'achat, d'envoyer un message au vendeur via la page de son produit. Lorsque l'envoi du message est confirmé, on viendra insérer dans une table ( MANY TO MANY ) products_schema.messages.


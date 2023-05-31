-- USERS --
INSERT INTO users_schema.users (id, name, email, password, phone) VALUES (1, 'Antoine', 'antoine@gmail.com', 'antoine', '0606060606');
INSERT INTO users_schema.users (id, name, email, password, phone) VALUES (2, 'Erwan', 'erwan@gmail.com', 'erwan', '0606060606');

-- PRODUCTS --

INSERT INTO products_schema.products(seller_id, name, description, price, images) VALUES(1, 'T-shirt', 'T-shirt de couleur bleu', 10.00, '{"https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"}');

INSERT INTO products_schema.order(buyer_id, product_id) VALUES(1, 1);

INSERT INTO products_schema.messages(sender_id, receiver_id, message) VALUES(2, 1, 'Bonjour, je suis intéressé par votre produit super beau');

-- FORUM --

INSERT INTO forum_schema.category(id, name, description) VALUES(1, 'Catégorie 1', 'Description de la catégorie 1');

INSERT INTO forum_schema.subject(category_id, title, description) VALUES(1, 'Sujet 1', 'Description du sujet 1');

INSERT INTO forum_schema.post(subject_id, user_id, content) VALUES(1, 1, 'Contenu du post 1');

-- GALLERY --

INSERT INTO gallery_schema.albums(id, title, description, user_id) VALUES(1, 'Galerie 1', 'Description de la galerie 1', 1);

INSERT INTO gallery_schema.pictures(album_id, source, description) VALUES(1, 'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png', 'Description de la photo');



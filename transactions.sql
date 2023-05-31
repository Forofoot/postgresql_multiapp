-- Active: 1684760132486@@127.0.0.1@5432@multiapp
BEGIN;

    INSERT INTO users_schema.users (id, name, email, password, phone) VALUES (100, 'TransactionTest', 'transaction@gmail.com', 'transaction', '0606060606');

    UPDATE users_schema.users SET order_nbr = order_nbr + 1 WHERE id = 100;

    SAVEPOINT savepoint1;

    SELECT * FROM users_schema.users;

    INSERT INTO products_schema.products(seller_id, name, description, price, images) VALUES(100, 'T-shirt transaction', 'T-shirt de couleur bleu', 10.00, '{"https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"}');

    SELECT * FROM products_schema.products;

    ROLLBACK TO savepoint1;

    SELECT * FROM products_schema.products;
    
    SELECT * FROM users_schema.users;

    ROLLBACK;

END;

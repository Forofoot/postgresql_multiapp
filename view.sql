-- Active: 1684760132486@@127.0.0.1@5432@multiapp@products_schema

-- VIEW FOR PRODUCT VIEW --
DROP VIEW IF EXISTS products_schema.product_view CASCADE;
CREATE VIEW products_schema.product_view
AS
( SELECT
    p.name,
    p.description,
    p.price,
    u.email
   FROM products_schema.products AS p
   JOIN users_schema.users AS u ON p.seller_id = u.id
   );

SELECT * FROM products_schema.product_view;
-- VIEW FOR PRODUCTS ORDERED --
DROP VIEW IF EXISTS products_schema.products_ordered_view CASCADE;

CREATE VIEW products_schema.products_ordered_view
AS
(SELECT
        u.email,
        p.name,
        p.price,
        O.created_at
    FROM products_schema.order AS O
    JOIN products_schema.products AS p ON O.product_id = p.id
    JOIN users_schema.users AS u ON O.buyer_id = u.id
    ORDER BY O.created_at DESC
);

SELECT * FROM products_schema.products_ordered_view;

-- VIEW FOR PRODUCT MESSAGES --
DROP VIEW IF EXISTS products_schema.product_messages_view CASCADE;

CREATE VIEW products_schema.product_messages_view
AS
(SELECT
    sender.email AS sender_id,
    receiver.email AS receiver_id,
    mess.message,
    p.name,
    m.created_at

    FROM products_schema.product_messages AS m
    JOIN products_schema.products AS p ON m.product_id = p.id
    JOIN products_schema.messages AS mess ON m.message_id = mess.id
    JOIN users_schema.users AS sender ON mess.sender_id = sender.id
    JOIN users_schema.users AS receiver ON mess.receiver_id = receiver.id
);

SELECT * FROM products_schema.product_messages_view;
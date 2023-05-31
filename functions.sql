-- USERS FUNCTIONS --

CREATE OR REPLACE FUNCTION trigger_order_nbr()
RETURNS TRIGGER AS $$
    BEGIN
        UPDATE users_schema.users SET order_nbr = order_nbr + 1 WHERE id = NEW.buyer_id;
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS incr_order_nbr ON products_schema.order;

CREATE TRIGGER incr_order_nbr
    AFTER INSERT ON products_schema.order
    FOR EACH ROW EXECUTE PROCEDURE trigger_order_nbr();

-- PRODUCTS FUNCTIONS --

CREATE OR REPLACE FUNCTION trigger_product_ordered() 
RETURNS TRIGGER AS $$
    BEGIN
        INSERT INTO products_schema.ordered(order_id, product_id) VALUES(NEW.id, NEW.product_id);
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS insert_product_ordered ON products_schema.order;

CREATE TRIGGER insert_product_ordered
    AFTER INSERT ON products_schema.order
    FOR EACH ROW EXECUTE PROCEDURE trigger_product_ordered();


CREATE OR REPLACE FUNCTION trigger_product_message()
RETURNS TRIGGER AS $$
    BEGIN
        INSERT INTO products_schema.product_messages(message_id, product_id) VALUES(NEW.id, 1);
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS insert_product_message ON products_schema.messages;

CREATE TRIGGER insert_product_message
    AFTER INSERT ON products_schema.messages
    FOR EACH ROW EXECUTE PROCEDURE trigger_product_message();

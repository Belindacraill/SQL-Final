--PRODUCT TABLE--

CREATE TABLE product (
   product_id bigserial PRIMARY KEY NOT NULL,
   description varchar(100) NOT NULL,
   price numeric (20,2) NOT NULL
);

INSERT INTO product(description, price)
   VALUES 
       ('Coke',7.5),
       ('Doritos', 8.5),
       ('BarOne', 9.5),
       ('Fanta', 7.5),
       ('Juice', 10.5);
       
SELECT * FROM product;

--CART TABLE--

CREATE TABLE cart (
   product_id bigint PRIMARY KEY NOT NULL,
   quantity bigint NOT NULL
);

SELECT description,quantity,price,quantity*price AS subtotal FROM cart
INNER JOIN product ON cart.product_id=product.product_id;


--LOADING TEST DATA INTO THE CART

INSERT INTO cart (product_id, quantity)
VALUES (1, 2),
       (2, 1),
       (3, 4),
       (4, 3),
       (5, 2);
 
 SELECT * FROM cart;
 
 --ADD TO CART WRONG
  
IF EXISTS (SELECT 1 FROM cart c WHERE c.product_id=1) 
THEN update cart set cart_id = cart-id+1 where- exissts
ELSE 
INSERT INTO cart(quantity) VALUES('coke','7,5');
END IF;

--ADD TO CART CORRECT 
 
update cart set cart.quantity = cart.quantity+1 
where exists (SELECT * FROM cart c WHERE c.product_id=5)--IF THIS PRODUCT EXISTS THEN THE UPDATE WILL BE DONE
and cart.product_id=5;

--SHOW CART

SELECT description,quantity,price,quantity*price AS subtotal FROM cart
INNER JOIN product ON cart.product_id=product.product_id;

--REMOVE FROM CART

update cart set cart.quantity = cart.quantity-1 
where exists (SELECT * FROM cart c WHERE c.product_id=5)--IF THIS PRODUCT EXISTS THEN THE UPDATE WILL BE DONE
and cart.product_id=5;
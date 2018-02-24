	-- Drops the bamazon if it exists currently --
	DROP DATABASE IF EXISTS bamazon;
	-- Creates the "bamazon" database --
	CREATE DATABASE bamazon;

	-- Makes it so all of the following code will affect bamazon --
	USE bamazon;

	-- Creates the table "products" within bamazon --
	CREATE TABLE products (
	  -- Creates a numeric column called "item_id" which will automatically increment its default value as we create new rows --
	  item_id INTEGER(11) AUTO_INCREMENT NOT NULL,
	  -- Makes a string column called "product_name" which cannot contain null --
	  product_name VARCHAR(30) NOT NULL,
	  -- Makes a sting column called "department_name" --
	  department_name VARCHAR(30),
	  -- Makes an numeric column called "price" --
	  price INTEGER(10) NOT NULL,
	   -- Makes an numeric column called "stock_quantity" --
	  stock_quantity INTEGER(10) NOT NULL, 
	  -- Sets item_id as this table's primary key which means all data contained within it will be unique --
	  PRIMARY KEY (item_id)
	);

	-- Creates new rows containing data in all named columns --
	INSERT INTO products (product_name, department_name, price, stock_quantity)	VALUES ("basketball", "sports", "8", "30");
	INSERT INTO `bamazon`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('mitt', 'sports', '12', '25');
	INSERT INTO `bamazon`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('puzzle', 'games', '4', '75');
	INSERT INTO `bamazon`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('jenga', 'games', '6', '40');
	INSERT INTO `bamazon`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('dishwasher', 'appliance', '120', '8');
	INSERT INTO `bamazon`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('fridge', 'appliance', '90', '12');
	INSERT INTO `bamazon`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('bike', 'sports', '60', '15');
	INSERT INTO `bamazon`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('lamp', 'appliance', '18', '30');
	INSERT INTO `bamazon`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('bat', 'sports', '9', '18');
	INSERT INTO `bamazon`.`products` (`product_name`, `department_name`, `price`, `stock_quantity`) VALUES ('racket', 'sports', '10', '10');


	SELECT * FROM products;

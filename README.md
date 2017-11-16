# bamazon

This is a storefront like app that allows the user to see a catalog of items, the price and quantity of those items. Using sublime text an order can be placed and the inventory can be observed as changes from a mySQL database. This app requires both the mysql and inquirer NPM packages, so make sure those are added locally for the app to run.

	npm install --save mysql
	npm install -- save inquirer

Upon running the app, the inventory of items should appear with all of the proper details (item_id, product_name, department_name, price and stock_quantity). The user will be prompted to select the item they would like to purchase by using the unique item_id that corresponds to the product_name.

The user will then be prompted to give the quantity of that item they would like to purchase. If the desired quantity is more than there are of that item in stock, the user will be notified, and they will be asked again which item they are looking to buy. If the desired quantity is less than the current stock amount, the user will be notified that their order has been placed. After this the user will see an updated inventory and will be asked again which item they would like to purchase.

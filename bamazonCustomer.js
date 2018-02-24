var mysql = require("mysql");
var inquirer = require("inquirer");

// create the connection information for the sql database
var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "Gizmos11",

  database: "Bamazon"
});

// connect to the mysql server and sql database
connection.connect(function(err) {
  if (err) throw err;
  // run the start function after the connection is made to prompt the user
  purchase();
});

// function which prompts the user for what action they should take
function start() {
  connection.query("SELECT * FROM products", function(err, res) {
    if (err) throw err;
    console.log(res);
  });
}

// function to handle buying an item
function purchase() {
  // query the database for all items being sold
  connection.query("SELECT * FROM products", function(err, results) {
    if (err) throw err;
    // once you have the items, prompt the user for which they'd like to bid on
    inquirer
      .prompt([
        {
          name: "choice",
          type: "list",
          choices: function() {
            var choiceArray = [];
            for (var i = 0; i < results.length; i++) {
              choiceArray.push(results[i].item_id);
            }
            return choiceArray;
          },
          message: "What is the item id of the product you would like to purchase?"
        },
        {
          name: "quantity",
          type: "input",
          message: "How many items would you like to purchase?"
        }
      ])
      .then(function(answer) {
        // get the information of the chosen item
        var chosenItem;
        for (var i = 0; i < results.length; i++) {
          if (results[i].item_id === answer.choice) {
            chosenItem = results[i];
          }
        }

        // determine if quantity of stock is high enough
        if (chosenItem.stock_quantity > parseInt(answer.quantity)) {
          // stock was high enough, so update db, let the user know, and start over
          connection.query(
            "UPDATE products SET ? WHERE ?",
            [
              {
                stock_quantity: stock_quantity - answer.quantity
              },
              {
                item_id: chosenItem.id
              }
            ],
            function(error) {
              if (error) throw err;
              console.log("Your order has been placed!");
              purchase();
            }
          );
        }
        else {
          // quantity of stock is not high enough, so apologize and start over
          console.log("We do not have enough in stock...");
          purchase();
        }
      });
  });
}

//
//  AddItemController.swift
//  Nu Crepes
//
//  Created by JJ Zapata on 10/8/20.
//  Copyright © 2020 Jorge Zapata. All rights reserved.
//

import UIKit

class AddItemController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var prices = [7.25, 7.25, 7.50, 7.50, 7.50, 6.75, 8.75, 9.00, 6.50, 6.50, 6.00, 6.25, 6.00, 6.50, 6.50, 6.50, 5.50, 4.50, 4.50, 8.25, 8.25, 8.75, 8.25, 8.25, 7.00, 9.00, 8.25, 9.00, 9.00, 8.00, 4.00]
    
    var titles = ["B1 | $7.25",
                "B2 | $7.25",
                "B3 | $7.50",
                "B4 | $7.50",
                "B5 | $7.50",
                "B6 | $6.75",
                "B7 | $8.75",
                "Lumberjack'd | $9",
                "Campfire | $6.50",
                "The Blonde | $6.50",
                "Strawberry Cheesecake | $6.00",
                "The King | $6.25",
                "Lemon Curd | $6.00",
                "The BOMB | $6.50",
                "G-Thang | $6.50",
                "Peanut Butter Kisses | $6.50",
                "Nutella | $5.50",
                "Sugar & Butter | $4.5",
                "Cinnamon Sugar & Butter | $4.5",
                "Banger Toastie | $8.25",
                "BBQ Chicken | $8.25",
                "Cali | $8.75",
                "Chicago SMOG | $8.25",
                "Hail Caesar | $8.25",
                "Ham & Swiss | $7",
                "Inside Out Boy | $9",
                "Kickin’ Chicken | $8.25",
                "Porko Loco | $9",
                "Roasted Veggie | $9",
                "Veggie | $8",
                "Plain Jane | $4"
                ]
    var descs = ["One fresh egg, bacon & cheddar",
                "One fresh egg, maple ginger sausage, & cheddar",
                "One fresh egg, ham, green peppers & cheddar",
                "One fresh egg, chorizo, pico de gallo & mozz/prov",
                "Two fresh eggs, spinach, mushrooms, caramelized onions & baby swiss",
                "Two fresh eggs & choice of cheese",
                "Egg whites, apple rosemary chicken-sausage, sauteed mushrooms, roma tomatoes, arugula & mozz/prov",
                "Two fresh eggs, hash browns**, choice of one breakfast protein, cheddar, green onion & a shot of maple syrup on side",
                "Marshmallows, chocolate chips, graham cracker, biscoffff & dark chocolate sauce",
                "Biscoffff, banana & house made caramel",
                "Fresh sweetened strawberries with homemade frosting",
                "Peanut butter & fresh banana",
                "House made lemon curd, dusted with powdered sugar",
                "Brown sugar, cinnamon & homemade frosting",
                "White chocolate, peanut butter, caramel, dark chocolate sauce & pretzels",
                "Peanut butter, chocolate kisses, peanut butter cookie dough & biscoffff sprinkled with organic sugar",
                "Additional ingredients .75 ea banana, peanut butter, raspberry jam, fresh strawberries",
                "Caramelized sugar and butter rolled up in a crepe",
                "Caramelized cinnamon sugar rolled up in a crepe",
                "Maple ginger sausage, caramelized onions, garlic mayo & baby swiss",
                "Grilled chicken breast, tangy bbq sauce, green onions, cilantro & cheddar",
                "Turkey, ham, avocado, bacon, spinach, cilantro-lime ranch & mozz/prov",
                "Italian sausage, mushroom, onion, green peppers, giardiniera, garlic mayo & mozz/prov",
                "Grilled chicken breast, spinach, roma tomatoes, creamy caesar & mozz/prov",
                "Ham, dijon mayo & baby swiss",
                "Fried egg outside, chorizo, grilled chicken breast, spinach, chipotle mayo &mozz/prov",
                "Grilled chicken breast, bacon, buffalo sauce, ranch & cheddar",
                "Bacon, maple ginger sausage, chorizo, ham, cheddar, baby swiss, garlic mayo & sriracha",
                "Roasted squash/zucchini/asparagus/red pepper, cilantro-pistachio pesto, mozz/prov & goat cheese",
                "Spinach, carrots/zucchini, caramelized onions, hummus & mozz/prov",
                "It's just a crepe"
                ]
    
    var typeOf = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print(self.prices.count)
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addMenuItemCatItemCell", for: indexPath) as! HomeCategoryMenu
        cell.largeView.dropShadow1()
        cell.textTitle!.text! = titles[indexPath.row]
        cell.textDescription!.text! = descs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Add \(self.titles[indexPath.row])?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            // make an object
            let orderObject = OrderObject()
            orderObject.descriptionOfMenuItem = self.descs[indexPath.row]
            orderObject.titleOfMenuItem = self.titles[indexPath.row]
            orderObject.priceOfMenuItem = self.prices[indexPath.row]
            // add to global variable array
            GlobalVariables.orderList.append(orderObject)
            let secondAlert = UIAlertController(title: "Added!", message: "Continue adding, or to checkout", preferredStyle: .alert)
            secondAlert.addAction(UIAlertAction(title: "Continue Adding", style: .default, handler: nil))
            secondAlert.addAction(UIAlertAction(title: "To Checkout", style: .default, handler: { (action) in
                self.dismiss(animated: true, completion: nil)
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(secondAlert, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

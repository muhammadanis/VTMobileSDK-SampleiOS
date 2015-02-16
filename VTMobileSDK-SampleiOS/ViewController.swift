//
//  ViewController.swift
//  VTMobileSDK-SampleiOS
//
//  Created by Muhammad Anis on 2/12/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let CellIdentifier: String = "CellIdentifier"
    
    @IBOutlet weak var cartLabel: UILabel!
    
    var cart : [VTItem : Int] = [:]
    
    var items : [VTItem] = []
    
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        VTMobileConfig.setIsProduction(false)
        VTMobileConfig.setClientKey("VT-client-SimkwEjR3_fKj73D")
        
        
        VTMobile.getAllProducts { (response: VTGetProductResponse!, ex :NSException!) -> Void in
            if(ex == nil){
                for product in response.products!{
                    self.items.append(VTItem(id: product.productId,imageName: "",name: product.name,price: product.price))
                }
                self.productTableView.reloadData()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var row = indexPath.row
        
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier)! as UITableViewCell
        
        //set image
        var itemImage : UIImageView? = cell.contentView.viewWithTag(1) as? UIImageView
        if(itemImage != nil){
            itemImage!.image = UIImage(named: "motor1")
        }
        
        //set item name
        var labelName : UILabel? = cell.contentView.viewWithTag(2) as? UILabel
        if(labelName != nil){
            labelName!.text = items[row].name
        }
        
        //set price
        var labelPrice : UILabel? = cell.contentView.viewWithTag(3) as? UILabel
        if(labelPrice != nil){
            labelPrice!.text = "\(items[row].price)"
        }
        
        var buyBtn : UIButton? = cell.contentView.viewWithTag(4) as? UIButton
        if(buyBtn != nil){
            buyBtn!.tag = row
        }
        
        return cell as UITableViewCell
    }

    
    @IBAction func buyClicked(sender: AnyObject) {
        let row:Int? = sender.tag
        if(row != nil){
            cart[items[row!]] = cart[items[row!]] == nil ? 1 : cart[items[row!]]!+1
            updatePrice()
        }
    }
    
    func updatePrice(){
        var totalPrice : Int = 0
        for(item,quantity) in cart{
            totalPrice += item.price * quantity
        }
        cartLabel.text = "Total Price: \(totalPrice)"
    }
    
    @IBAction func checkoutClicked(sender: AnyObject) {
        println("data")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var checkoutController : CheckoutController = segue.destinationViewController as CheckoutController
        var checkoutItems : [VTCheckout] = []
        for(item,quantity) in cart{
            checkoutItems.append(VTCheckout(item: item, quantity: quantity))
        }
        checkoutController.checkoutItems = checkoutItems
        
    }
    

}


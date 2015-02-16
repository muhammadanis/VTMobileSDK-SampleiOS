//
//  CheckoutController.swift
//  VTMobileSDK-SampleiOS
//
//  Created by Muhammad Anis on 2/16/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

import UIKit

class CheckoutController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate {

    var totalPrice : Int = 0
    var checkoutItems: [VTCheckout] = []
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    @IBOutlet weak var tokenLabel: UILabel!
    
    let CellIdentifier: String = "CellIdentifierCheckout"
    
    var token: VTTokenData? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        for checkoutItem in checkoutItems{
            self.totalPrice += checkoutItem.item.price
        }
        
        priceLabel.text = "Total Price: \(self.totalPrice)"
        
    }
    
    
    @IBAction func payButtonClick(sender: AnyObject) {
        var cardDetails = VTCardDetails()
        //TODO: Input your customer's credit card from input
        cardDetails.card_number = "4811111111111114"
        cardDetails.card_cvv = "123"
        cardDetails.card_exp_month = 1
        cardDetails.card_exp_year = 2020;
        cardDetails.secure = true
        cardDetails.gross_amount = "\(self.totalPrice)"
        
        var request = VTTokenRequest()
        //iterate product
        request.cardDetails = cardDetails
        
        VTMobile.getToken({ (response: VTTokenResponse!, ex:NSException!) -> Void in
            if(ex == nil){
                self.token = VTTokenData()
                self.token!.token_id = response.token_id
                self.tokenLabel.text = "Token: \(response.token_id)"
                if(response.redirect_url != nil){
                    let webView :UIWebView = UIWebView(frame: CGRectMake(0, 0, 400, 420))
                    webView.loadRequest(NSURLRequest(URL: NSURL(string: response.redirect_url)!))
                    webView.delegate = self
                    self.view.addSubview(webView)
                }
            }else{
                println(ex.reason)
            }
        }, withRequest: request)
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true;
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        println("WebView start with error \(error)")
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        if(webView.request?.URL.absoluteString?.rangeOfString("callback") != nil){
            //remove webview from parent
            webView.removeFromSuperview();
            //start charging
            let chargeRequest = VTChargeRequest()
            //iterate through product
            for (item) in checkoutItems{
                var product = VTProduct()
                product.productId = item.item.id
                product.price = item.item.price
                product.quantity = item.quantity
                chargeRequest.item_details.addObject(product)
            }
            chargeRequest.email = "anis34@abc.com"
            chargeRequest.payment_type = "credit_card"
            chargeRequest.token_data = self.token!
            
            //start charging
            VTMobile.charge({ (response: VTChargeResponse!, ex: NSException!) -> Void in
            
                if(ex == nil){
                    println("success to charge with transaction id: \(response.transaction_id)")
                }else{
                    println(ex.reason)
                }
            }, withChargeRequest: chargeRequest)
            
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkoutItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var row = indexPath.row
        
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier)! as UITableViewCell
        
        //set product name
        var labelName : UILabel? = cell.contentView.viewWithTag(1) as? UILabel
        if(labelName != nil){
            labelName!.text = checkoutItems[row].item.name
        }
        
        //set quantity label
        var quantityLabel : UILabel? = cell.contentView.viewWithTag(2) as? UILabel
        if(quantityLabel != nil){
            quantityLabel!.text = "x\(checkoutItems[row].quantity)"
        }
        
        //set total price label
        var priceLabel : UILabel? = cell.contentView.viewWithTag(3) as? UILabel
        if(priceLabel != nil){
            priceLabel!.text = "\(checkoutItems[row].item.price * checkoutItems[row].quantity)";
        }
        
        
        
        return cell
    }
}
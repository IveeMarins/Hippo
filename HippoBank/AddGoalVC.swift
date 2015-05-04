//
//  AddGoal.swift
//  HippoBank
//
//  Created by Haroldo Olivieri on 5/4/15.
//  Copyright (c) 2015 Hippo. All rights reserved.
//
import UIKit

class AddGoalVC : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var addView : AddGoalView!;
    var categories = CategoryType.getCategoryArray();
    let currencyFormatter = NSNumberFormatter();
    var price : Double!;
    var moneySaved : Double!;

    
    //IR PARA PARTE DE VIEW
    override func viewDidLoad(){
        addView = AddGoalView(view: view, parent: self);
        
        addView.cancelButton.addTarget(self, action: "cancelAction:", forControlEvents: UIControlEvents.TouchUpInside)
        addView.saveButton.addTarget(self, action: "saveAction:", forControlEvents: UIControlEvents.TouchUpInside)
        addView.dismissButton.addTarget(self, action: "dismissKeyBoard:", forControlEvents: UIControlEvents.TouchUpInside)
        
        (addView.categoryTypeText.inputView as! UIPickerView).delegate = self;
        (addView.categoryTypeText.inputView as! UIPickerView).dataSource = self;
        
        addView.moneySavedText.addTarget(self, action: "savedCurrencyDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        addView.priceText.addTarget(self, action: "priceCurrencyDidChange:", forControlEvents: UIControlEvents.EditingChanged)

        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
    }
    
    func savedCurrencyDidChange(textField: UITextField) {
        var text = textField.text.stringByReplacingOccurrencesOfString(currencyFormatter.currencySymbol!, withString: "").stringByReplacingOccurrencesOfString(currencyFormatter.groupingSeparator, withString: "").stringByReplacingOccurrencesOfString(currencyFormatter.decimalSeparator!, withString: "")
        addView.moneySavedText.text = currencyFormatter.stringFromNumber((text as NSString).doubleValue / 100.0)
        moneySaved = (text as NSString).doubleValue / 100.0
    }
    
    func priceCurrencyDidChange(textField: UITextField) {
        var text = textField.text.stringByReplacingOccurrencesOfString(currencyFormatter.currencySymbol!, withString: "").stringByReplacingOccurrencesOfString(currencyFormatter.groupingSeparator, withString: "").stringByReplacingOccurrencesOfString(currencyFormatter.decimalSeparator!, withString: "")
        addView.priceText.text = currencyFormatter.stringFromNumber((text as NSString).doubleValue / 100.0)
        price = (text as NSString).doubleValue / 100.0
    }
    
    func cancelAction (sender: UIButton){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func saveAction(sender: UIButton){
        
        var goal = Goal()
        goal.name = addView.nomeText.text;
        goal.price = Float(price)
        goal.moneySaved = Float(moneySaved)
        goal.categoryType = CategoryType.convert(addView.categoryTypeText.text)
        goal.priority = 0
       
        GoalDAO.sharedInstance.saveGoal(goal)
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func dismissKeyBoard (sender: UIButton){
        addView.categoryTypeText.resignFirstResponder();
        addView.nomeText.resignFirstResponder();
        addView.priceText.resignFirstResponder();
        addView.moneySavedText.resignFirstResponder();
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(categories.count == 0){
            return 1;
        }
        return categories.count;
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if(categories.count == 0){
            return "No subjects available";
        }
        return categories[row];
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(row < categories.count){
            addView.categoryTypeText.text = categories[row];
        }
    }
}
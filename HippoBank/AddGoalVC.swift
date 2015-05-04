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
    var goal: Goal?
    
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
        
        addView.sliderPriority.addTarget(self, action: "changeSlider:", forControlEvents: UIControlEvents.ValueChanged);
        
        if(goal != nil){
            
            addView.nomeText.text = goal!.name
            addView.priceText.text = String(stringInterpolationSegment: goal!.price * 10)
            priceCurrencyDidChange(addView.priceText)
            addView.moneySavedText.text = String(stringInterpolationSegment: goal!.moneySaved * 10)
            savedCurrencyDidChange(addView.moneySavedText);
            
            addView.categoryTypeText.text = goal!.categoryType.description
            
            if(goal!.priority == 1){
                addView.sliderPriority.value = 1;
                addView.priority.text = "Low";
                
            }else if(goal!.priority == 2){
                addView.sliderPriority.value = 2;
                addView.priority.text = "Medium";
                
            }else{
                addView.sliderPriority.value = 3;
                addView.priority.text = "High";
            }
            
        }
        
        
    }
    
    func changeSlider(sender: UISlider){
        println("slider");
        if (sender.value <= 1){
            addView.priority.text = "Low";
        }else if (sender.value <= 2){
            addView.priority.text = "Medium";
        }else{
            addView.priority.text = "High";
        }

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
        
        
        if(addView.nomeText.text == ""){
            
            var alert = UIAlertController(title: "Missing name", message: "Please complete the name field", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else if(addView.priceText.text == ""){
            
            var alert = UIAlertController(title: "Missing price", message: "Please complete the price field", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        else if(addView.categoryTypeText.text == ""){
            
            var alert = UIAlertController(title: "Missing category", message: "Please pick a category", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        else{
            
            if(addView.moneySavedText.text == ""){
                moneySaved = 0;
            }
            
            if(goal == nil){
                var newGoal = Goal()
                newGoal.name = addView.nomeText.text;
                newGoal.price = Float(price)
                newGoal.moneySaved = Float(moneySaved)
                newGoal.categoryType = CategoryType.convert(addView.categoryTypeText.text)
               
                if(addView.priority.text == "Low"){
                    newGoal.priority = 1
                }
                else if(addView.priority.text == "Medium"){
                    newGoal.priority = 2
                }
                else{
                    newGoal.priority = 3
                }
                
                GoalDAO.sharedInstance.saveGoal(newGoal)
            }
            else{
                GoalDAO.sharedInstance.deleteGoal(goal!.id)
                
                goal?.name = addView.nomeText.text;
                goal?.price = Float(price)
                goal?.moneySaved = Float(moneySaved)
                goal?.categoryType = CategoryType.convert(addView.categoryTypeText.text)
                
                if(addView.priority.text == "Low"){
                    goal?.priority = 1
                }
                else if(addView.priority.text == "Medium"){
                    goal?.priority = 2
                }
                else{
                    goal?.priority = 3
                }
                
                
                GoalDAO.sharedInstance.saveGoal(goal!)
            }
     
            NSNotificationCenter.defaultCenter().postNotificationName("addedGoal", object: nil);
            dismissViewControllerAnimated(true, completion: nil)
        }
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
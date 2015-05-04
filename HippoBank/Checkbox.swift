//
//  Checkbox.swift
//  HippoBank
//
//  Created by Adriano Alves Ribeiro Gonçalves on 5/4/15.
//  Copyright (c) 2015 Hippo. All rights reserved.
//

import UIKit

class Checkbox: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    //images
    let checkedImage = UIImage(named: "addButton")
    let unCheckedImage = UIImage(named: "favorite")
    
    //control
    var isChecked: Bool = false{
        
        didSet{
            if isChecked == true{
                self.setImage(checkedImage, forState: .Normal)
            }
            else{
                self.setImage(unCheckedImage, forState: .Normal)
            }
            
        }
        
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
    }
    
    func buttonClicked(sender:UIButton){
        if(sender == self){
            if isChecked == true{
                isChecked = false
            }
            else{
                
                isChecked = true
            }
            
        }
        
        
        
    }
    
}

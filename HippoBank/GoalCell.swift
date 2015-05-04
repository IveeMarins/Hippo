//
//  GoalCell.swift
//  Hippo
//
//  Created by Haroldo Olivieri
//

import UIKit

class GoalCell : UITableViewCell {
    
    var categoryImage : UIImageView!;
    var labelCategory : UILabel!;
    var labelName : UILabel!;
    var labelTotalPrice : UILabel!;
    var labelTotalDesc : UILabel!;
    var labelMoneySaved : UILabel!;
    var labelMoneySavedDesc : UILabel!;
    
    var imagePriorityLow : UIImageView!;
    var imagePriorityMedium : UIImageView!;
    var imagePriorityHigh : UIImageView!;
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(view: UIView) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: nil)

        self.frame = view.frame;
        self.backgroundColor = UIColor.UIColorFromRGB(0x1bb478);
        
        var cellHeight = view.frame.height/3.5;
        var cellWidth = view.frame.width;
        
        categoryImage = UIImageView(frame: CGRectMake(0,cellHeight*0.1, cellHeight*0.8, cellHeight*0.8));
        categoryImage.image = UIImage(named: "categoryClothes");
        categoryImage.contentMode = UIViewContentMode.ScaleAspectFit;
        
//        labelCategory = UILabel(frame: CGRectMake(categoryImage.bounds.origin.x,
//            cellHeight*0.8 - 20,
//            categoryImage.frame.width,
//            cellHeight*0.1));
//        labelCategory.font = UIFont(name: "AvenirNext-DemiBold", size: 15);
//        labelCategory.textColor = UIColor.UIColorFromRGB(0x792a90);
//        //labelCategory.text = goals[indexPath.row].categoryType.description;
//        labelCategory.textAlignment = NSTextAlignment.Center;
        
        labelName = UILabel(frame: CGRectMake(cellWidth/2,cellHeight*0.1, cellWidth/2 - cellHeight*0.1 , cellHeight*0.2));
        labelName.font = UIFont(name: "AvenirNext-DemiBold", size: 30)
        labelName.textAlignment = NSTextAlignment.Right;
        labelName.textColor = UIColor.whiteColor();
        //labelName.text = goals[indexPath.row].name.capitalizedString;
        
        labelTotalPrice = UILabel(frame: CGRectMake(cellWidth/2,cellHeight*0.3, (cellWidth - cellWidth/2) - cellHeight*0.1 , cellHeight*0.2));
        labelTotalPrice.font = UIFont(name: "Avenir Next", size: 19)
        labelTotalPrice.textAlignment = NSTextAlignment.Right;
        labelTotalPrice.textColor = UIColor.UIColorFromRGB(0x792a90);
        //labelTotalPrice.text = NSString(format:"R$ %.2f", goals[indexPath.row].price) as String;
        
        labelTotalDesc = UILabel(frame: CGRectMake(labelTotalPrice.frame.origin.x - cellHeight*0.2,cellHeight*0.3, cellWidth/5 , cellHeight*0.2));
        labelTotalDesc.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
        labelTotalDesc.textAlignment = NSTextAlignment.Left;
        labelTotalDesc.textColor = UIColor.UIColorFromRGB(0x792a90);
        labelTotalDesc.text = "Price";
        
        labelMoneySaved = UILabel(frame: CGRectMake(cellWidth/2,cellHeight*0.5, cellWidth/2 - cellHeight*0.1 , cellHeight*0.2));
        labelMoneySaved.font = UIFont(name: "Avenir Next", size: 20)
        labelMoneySaved.textAlignment = NSTextAlignment.Right;
        labelMoneySaved.textColor = UIColor.blackColor();
        //labelMoneySaved.text = NSString(format:"R$ %.2f", goals[indexPath.row].moneySaved) as String;
        
        labelMoneySavedDesc = UILabel(frame: CGRectMake(labelMoneySaved.frame.origin.x - cellHeight*0.2,cellHeight*0.5, cellWidth/4 , cellHeight*0.2));
        
        labelMoneySavedDesc.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
        labelMoneySavedDesc.textAlignment = NSTextAlignment.Left;
        labelMoneySavedDesc.textColor = UIColor.blackColor()
        labelMoneySavedDesc.text = "Saved";
        
        imagePriorityLow = UIImageView(frame: CGRectMake(cellWidth - cellHeight*0.3,cellHeight*0.7, cellHeight*0.18 , cellHeight*0.18));
        imagePriorityLow.image = UIImage(named: "favorite");
        imagePriorityLow.contentMode = UIViewContentMode.ScaleAspectFit;
        
        imagePriorityMedium = UIImageView(frame: CGRectMake(imagePriorityLow.frame.origin.x - cellHeight*0.3, cellHeight*0.7, cellHeight*0.18 , cellHeight*0.18));
        imagePriorityMedium.image = UIImage(named: "favorite");
        imagePriorityMedium.contentMode = UIViewContentMode.ScaleAspectFit;
        
        imagePriorityHigh = UIImageView(frame: CGRectMake(imagePriorityMedium.frame.origin.x - cellHeight*0.3, cellHeight*0.7, cellHeight*0.18 , cellHeight*0.18));
        imagePriorityHigh.image = UIImage(named: "favorite");
        imagePriorityHigh.contentMode = UIViewContentMode.ScaleAspectFit;
        
        imagePriorityLow.hidden = true;
        imagePriorityMedium.hidden = true;
        imagePriorityHigh.hidden = true;
        
        layoutMargins = UIEdgeInsetsZero;
        preservesSuperviewLayoutMargins = false;
        selectionStyle = UITableViewCellSelectionStyle.None;
        
        self.addSubview(categoryImage);
        self.addSubview(labelName);
        self.addSubview(labelTotalPrice);
        self.addSubview(labelMoneySaved);
        self.addSubview(labelMoneySavedDesc);
        self.addSubview(labelTotalDesc);
        self.addSubview(imagePriorityLow);
        self.addSubview(imagePriorityMedium);
        self.addSubview(imagePriorityHigh);

    }
}
//
//  AddProfessorView.swift
//  Stud
//
//  Created by Pietro Ribeiro Pepe on 4/4/15.
//  Copyright (c) 2015 Pietro Ribeiro Pepe. All rights reserved.
//

import Foundation
import UIKit

class AddGoalView : UIView{
    
    var cancelButton : UIButton!;
    var dismissButton : UIButton!;
    var saveButton : UIButton!;
    
    var title : UILabel!;
    var nomeText : UITextField!;
    var priceText : UITextField!;
    var moneySavedText : UITextField!;
    var categoryTypeText : UITextField!;
    
    var priority : UILabel!;
    var sliderPriority : UISlider!;

    init(view: UIView, parent: UIViewController) {
        super.init(frame: view.frame);
        
        let altura:CGFloat =  view.frame.height*0.08;
        let alturaLabel:CGFloat = view.frame.height*0.09
        
        // Blur Effect
        var blur = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurView = UIVisualEffectView(effect: blur)
        blurView.frame = view.bounds
        
        //declaracao da area e definicao do tamanho//
        var area:CGRect = CGRectMake(view.frame.width*0.05, view.frame.height*0.2, view.frame.width*0.90
            , altura*6);
        
        //definindo que eh a view eh a tela//
        var tela : UIView = UIView(frame: area)
        //acessando uma propriedade da tela(UIView) alterando as bordas//
        tela.layer.cornerRadius = 5
        tela.backgroundColor = UIColor.UIColorFromRGB(0x1bb478)
        
        dismissButton = UIButton(frame: CGRectMake(0,0, view.frame.width, view.frame.height))
        
        //adicionando uma subview(tela) dentro da tela principal//
        view.addSubview(blurView)
        view.addSubview(dismissButton)
        view.addSubview(tela)
        
        //criando campos de texto//
        let spacing:CGFloat = area.width*0.05;
        let spacingLabel: CGFloat = (blurView.frame).width*0.18
        
        title = UILabel(frame: CGRectMake(spacingLabel, alturaLabel, area.width*0.7, alturaLabel/2))
        title.textAlignment = NSTextAlignment.Center
        title.text = "New Goal"
        title.textColor = UIColor.whiteColor()
        title.font = UIFont(name: "AvenirNext-DemiBold", size: 28)
        
        //botao pra cancelar
        cancelButton = UIButton(frame: CGRectMake(spacing, altura/4, area.width*0.22, altura/2))
        cancelButton.setTitle("Cancel", forState: UIControlState.Normal)
        cancelButton.titleLabel!.font = UIFont(name: "AvenirNext-Medium", size: 20)
        cancelButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        //botao pra salver
        saveButton = UIButton(frame: CGRectMake(area.width - spacing - area.width*0.18, altura/4, area.width*0.2, altura/2))
        saveButton.setTitle("Save", forState: UIControlState.Normal)
        saveButton.titleLabel!.font = UIFont(name: "AvenirNext-Medium", size: 20)
        saveButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        // Name Text Field
        
        nomeText = UITextField(frame: CGRectMake(spacing, cancelButton.frame.origin.y + altura/1.4, area.width, altura))
        nomeText.font = UIFont(name: "AvenirNext-Regular", size: 18)
        nomeText.autocorrectionType = UITextAutocorrectionType.No;
        nomeText.placeholder = "Name"
        
        priceText = UITextField(frame: CGRectMake(spacing, nomeText.frame.origin.y + altura, area.width, altura))
        priceText.font = UIFont(name: "AvenirNext-Regular", size: 18)
        priceText.autocorrectionType = UITextAutocorrectionType.No;
        priceText.placeholder = "Price"
        priceText.keyboardType = UIKeyboardType.NumberPad
        
        moneySavedText = UITextField(frame: CGRectMake(spacing, priceText.frame.origin.y + altura, area.width, altura))
        moneySavedText.font = UIFont(name: "AvenirNext-Regular", size: 18)
        moneySavedText.placeholder = "Money Saved"
        moneySavedText.keyboardType = UIKeyboardType.NumberPad
        
        categoryTypeText = UITextField(frame: CGRectMake(spacing, moneySavedText.frame.origin.y + altura, area.width, altura))
        categoryTypeText.font = UIFont(name: "AvenirNext-Regular", size: 18)
        categoryTypeText.placeholder = "Categories"
        categoryTypeText.inputView = UIPickerView();
        
        var priorityLabel = UILabel(frame: CGRectMake(spacing,categoryTypeText.frame.origin.y + altura/2, area.width * 0.3, area.width * 0.33));
        priorityLabel.text = "Priority";
        priorityLabel.font = UIFont(name: "AvenirNext-Regular", size: 18)

        priority = UILabel(frame: CGRectMake(spacing + area.width * 0.33 ,categoryTypeText.frame.origin.y + altura/2, area.width * 0.3,area.width * 0.33));
        priority.text = "Low";
        priority.font = UIFont(name: "AvenirNext-Regular", size: 15)

        
        sliderPriority = UISlider(frame: CGRectMake(priority.frame.width + area.width * 0.33,categoryTypeText.frame.origin.y + altura/2, 100,100));
        sliderPriority.minimumValue = 0;
        sliderPriority.maximumValue = 3;
        
        
        var lineView : UIView = UIView (frame: CGRectMake(0, altura/1, area.width, 1))
        lineView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.7);
        
        var lineView1 : UIView = UIView (frame: CGRectMake(0, nomeText.frame.origin.y + altura/1, area.width, 1))
        lineView1.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.7);
        
        var lineView2 : UIView = UIView (frame: CGRectMake(0, priceText.frame.origin.y + altura/1, area.width, 1))
        lineView2.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.7);
        
        var lineView3 : UIView = UIView (frame: CGRectMake(0, moneySavedText.frame.origin.y + altura/1, area.width, 1))
        lineView3.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.7);

        var lineView4 : UIView = UIView (frame: CGRectMake(0, categoryTypeText.frame.origin.y + altura/1, area.width, 1))
        lineView4.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.7);
        
        //adicionar a view que criei na view pra aparecer na tela principal//
        blurView.addSubview(title)
        tela.addSubview(nomeText)
        tela.addSubview(priceText)
        tela.addSubview(moneySavedText)
        tela.addSubview(cancelButton)
        tela.addSubview(saveButton)
        tela.addSubview(categoryTypeText)
        tela.addSubview(priorityLabel)
        tela.addSubview(priority)
        tela.addSubview(sliderPriority)
        tela.addSubview(lineView)
        tela.addSubview(lineView1)
        tela.addSubview(lineView2)
        tela.addSubview(lineView3)
        tela.addSubview(lineView4)

    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
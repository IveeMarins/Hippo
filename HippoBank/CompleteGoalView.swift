//
//  CompleteGoalView.swift
//  HippoBank
//
//  Created by Adriano Alves Ribeiro Gonçalves on 5/4/15.
//  Copyright (c) 2015 Hippo. All rights reserved.
//

import Foundation
import UIKit

class CompleteGoalView: UIView {
    
    var completeLabel: UILabel!
    var happyHippo: UIImageView!
    
    init(view: UIView, parent: UIViewController){
        super.init(frame: view.frame)
        
        let altura:CGFloat =  view.frame.height*0.08;
        let alturaLabel:CGFloat = view.frame.height*0.09
        
        // Blur Effect
        var blur = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurView = UIVisualEffectView(effect: blur)
        blurView.frame = view.bounds
        
        let spacingLabel: CGFloat = (blurView.frame).width*0.18
        
        //declaracao da area e definicao do tamanho//
        var area:CGRect = CGRectMake(view.frame.width*0.05, view.frame.height*0.2, view.frame.width*0.90
            , altura*6);
        
        //definindo que eh a view eh a tela//
        var tela : UIView = UIView(frame: area)
        
        //acessando uma propriedade da tela(UIView) alterando as bordas//
        tela.layer.cornerRadius = 5
        tela.backgroundColor = UIColor.UIColorFromRGB(0x1bb478)
        
    
        completeLabel = UILabel(frame: CGRectMake(spacingLabel, alturaLabel, area.width*0.7, alturaLabel/2))
        completeLabel.textAlignment = NSTextAlignment.Center
        completeLabel.text = "You Did It!!"
        completeLabel.textColor = UIColor.whiteColor()
        completeLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 36)
        
        
        var width  = frame.width;
        var height  = frame.height;
        
        happyHippo = UIImageView(frame: CGRectMake(width * 0.15, height*0.5,width * 0.7,height * 0.4));
        happyHippo.image = UIImage(named: "hippoEmptyList");
        happyHippo.contentMode = UIViewContentMode.ScaleAspectFit;
        
        //adicionar a view que criei na view pra aparecer na tela principal//
        view.addSubview(blurView);
        blurView.addSubview(completeLabel)
        blurView.addSubview(happyHippo)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
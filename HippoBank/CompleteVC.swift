//
//  CompleteVC.swift
//  HippoBank
//
//  Created by Ivee Mendes Marins on 5/4/15.
//  Copyright (c) 2015 Hippo. All rights reserved.
//
import UIKit
import AVFoundation

class CompleteVC : UIViewController {
    
    var completeView : CompleteGoalView!;
    var backgroundMusic = AVAudioPlayer()
    
    override func viewDidLoad() {
        completeView = CompleteGoalView(view: view, parent: self);
        backgroundMusic = self.setupAudioPlayerWithFile("bensound-happyrock", type:"mp3")
        backgroundMusic.volume = 0.5
        backgroundMusic.play()
    }
    
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer{
        
        var path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        var url = NSURL.fileURLWithPath(path!)
        
        var error: NSError?
        
        var audioPlayer:AVAudioPlayer?
        audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
    
        return audioPlayer!
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        backgroundMusic.stop()
        dismissViewControllerAnimated(true, completion: nil)
    }
}
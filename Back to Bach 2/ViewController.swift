//
//  ViewController.swift
//  Back to Bach 2
//
//  Created by Ivaylo Todorov on 28.11.15 г..
//  Copyright © 2015 г. Ivaylo Todorov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func play(sender: AnyObject) {
        player.play()
    }
    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    @IBAction func stop(sender: AnyObject) {
        
        player.pause()
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")!))
           
        } catch {
        }
    }
    
    func updateScrubSlider() {
        
        scrubSlider.value = Float(player.currentTime)
        
    }
    
    @IBAction func adjustVolume(sender: AnyObject) {
        player.volume = volumeSlider.value
    }
    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var scrubSlider: UISlider!
    @IBAction func scrub(sender: AnyObject) {
        
        player.currentTime = NSTimeInterval(scrubSlider.value)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")!))
            scrubSlider.maximumValue = Float(player.duration)
            
        } catch {
            
    }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateScrubSlider"), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


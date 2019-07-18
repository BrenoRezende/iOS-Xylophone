//
//  ViewController.swift
//  Xylophone
//
//  Created by Breno Rezende on 18/07/2019.
//  Copyright © 2019 Brezende. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{

    var audioPlayer: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        
        playNote(sender.tag)
    }
    
    fileprivate func playNote(_ tag: Int) {
        
        guard let url = Bundle.main.url(forResource: "note\(tag)", withExtension: "wav") else {
            print("Error: Could not find audio file")
            return
        }
        
        audioPlayer = AVPlayer(url: url)
        audioPlayer?.play() ?? print("Error: Could not play")
    }

}


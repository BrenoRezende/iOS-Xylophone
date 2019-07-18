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

    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        
        if let audioPlayer = audioPlayer, audioPlayer.isPlaying { audioPlayer.stop() }
        print(sender.tag)
        guard let audioUrl = Bundle.main.path(forResource: "note\(sender.tag)", ofType: "wav") else {
            print("Error: No file with specified name exists")
            return
        }
        
        let xylophoneAudio = URL(fileURLWithPath: audioUrl)
        
        do {
//            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default)
//            try AVAudioSession.sharedInstance().setActive(true)
            let audioPlayer = try AVAudioPlayer(contentsOf: xylophoneAudio)
            audioPlayer.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }

}


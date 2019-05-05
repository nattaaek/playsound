//
//  Chapter1_80.swift
//  playsound
//
//  Created by user150172 on 1/27/19.
//  Copyright © 2019 harvestidea. All rights reserved.
//

import UIKit
import AVFoundation
import AudioKit

class Chapter1_80: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var btnNext: UIButton!
    var tracker: AKFrequencyTracker!
    var silence: AKBooster!
    var microphone: AKMicrophone!

    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true
        microphone = AKMicrophone()
        let filter = AKHighPassFilter(microphone, cutoffFrequency: 400.0, resonance: 0)
        tracker = AKFrequencyTracker(filter)
        silence = AKBooster(tracker, gain: 0)
        
        AKSettings.audioInputEnabled = true
        AudioKit.output = silence
        try! AudioKit.start()
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
                if self.tracker.frequency >= 330 && self.tracker.frequency <= 328 {
                    self.count  +=  1
                    if self.count >= 3 {
                        self.btnNext.isHidden = false
                        timer.invalidate()
                    }
                }
        }
    }
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_81")
        self.present(vc!, animated: true, completion: nil)
    }
}

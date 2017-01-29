//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Michael Montoya on 1/29/17.
//  Copyright © 2017 Michael Montoya. All rights reserved.
//

import UIKit

class RecordSoundsViewController: UIViewController {
    
    //==================================================
    // MARK: Outlets
    //==================================================
    
    @IBOutlet weak var tapToRecordLabel: UILabel!
    @IBOutlet weak var recordingButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    
    
    //==================================================
    // MARK: LifeCycle Functions
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopRecordingButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    
    //==================================================
    // MARK: Actions
    //==================================================

    @IBAction func recordAudioTapped(_ sender: Any) {
        
        tapToRecordLabel.text = "Recording in progress"
        stopRecordingButton.isEnabled = true
        recordingButton.isEnabled = false
        
        print("Record button was tapped!")
    }
    
    @IBAction func stopRecordingTapped(_ sender: Any) {
        
        tapToRecordLabel.text = "Tap to record"
        stopRecordingButton.isEnabled = false
        recordingButton.isEnabled = true
        
        print("Stop recording!")
    }


}


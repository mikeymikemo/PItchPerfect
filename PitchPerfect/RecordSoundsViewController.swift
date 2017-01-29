//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Michael Montoya on 1/29/17.
//  Copyright © 2017 Michael Montoya. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    //==================================================
    // MARK: Outlets
    //==================================================
    
    @IBOutlet weak var tapToRecordLabel: UILabel!
    @IBOutlet weak var recordingButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    //==================================================
    // MARK: Properties
    //==================================================
    
    
    var audioRecorder: AVAudioRecorder!
    
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
    // MARK: IBActions
    //==================================================
    
    @IBAction func recordAudioTapped(_ sender: Any) {
        
        tapToRecordLabel.text = "Recording in progress"
        stopRecordingButton.isEnabled = true
        recordingButton.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecordingTapped(_ sender: Any) {
        
        tapToRecordLabel.text = "Tap to record"
        stopRecordingButton.isEnabled = false
        recordingButton.isEnabled = true
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecordingButtonToResultVC", sender: audioRecorder.url)
            
        } else {
            print("Recording was not successful")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let playSoundsVC = segue.destination as! PlaySoundsViewController
        let recordedAudioURL = sender as! URL
        playSoundsVC.recordedAudioURL = recordedAudioURL
    }
}


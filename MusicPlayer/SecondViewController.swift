//
//  SecondViewController.swift
//  MusicPlayer
//
//  Created by Tazeen on 19/02/17.
//  Copyright © 2017 Tazeen. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func play(_ sender: Any)
    {
        if audioStuffed == true && audioPlayer.isPlaying == false
        {
            audioPlayer.play()
        }
    }
   
    
    @IBAction func pause(_ sender: Any)
    {
        if audioStuffed == true && audioPlayer.isPlaying
        {
                audioPlayer.pause()
        }
    }
  
    @IBAction func prev(_ sender: Any)
    {
        if thisSong == 1
        {
            playThis(thisOne: songs[thisSong-1])
            thisSong -= 1
            label.text = songs[thisSong]
        }
    }
    
    @IBAction func next(_ sender: Any)
    {
        if thisSong < songs.count-1
        {
        playThis(thisOne: songs[thisSong+1])
            thisSong += 1
        label.text = songs[thisSong]
        }
        
    }
   
    func playThis(thisOne: String)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!)as URL)
            
            audioPlayer.play()
            
        }
        catch
        {
            print("error")
        }
    }
    @IBAction func slider(_ sender: UISlider)
    {
        audioPlayer.volume = sender.value
    }
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
            label.text = songs[thisSong]
            
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  PlayAudio.swift
//  Developers
//
//  Created by Kathiravan Murali on 23/01/24.
//

import Foundation
import AVFoundation

var audioPlayer : AVAudioPlayer?

func playAudio (sound : String, format : String)
{
    if let path = Bundle.main.path(forResource: "sound-chime", ofType: "mp3")
    {
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }
        catch
        {
            print("Could not find file")
        }
            
    }
    else
    {
        print("hello")
    }
}

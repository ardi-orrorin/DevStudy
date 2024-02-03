//
//  PlaySound.swift
//  LearnByDoing
//
//  Created by 유승철 on 2/3/24.
//

import Foundation
import AVFoundation

var audioPlayter: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayter = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayter?.play()
        } catch {
            print("Could not find and play the sound file.")
        }
    }
}

//
//  File.swift
//  Sequencer
//
//  Created by Derek Cook on 8/27/21.
//  Copyright © 2021 Derek Cook. All rights reserved.
//

import Foundation
import AVFoundation

// MARK: - AUDIO PLAYER

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play this file")
        }
    }
}

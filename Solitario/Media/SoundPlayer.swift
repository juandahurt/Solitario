//
//  SoundPlayer.swift
//  Solitario
//
//  Created by Negro on 28/07/20.
//  Copyright © 2020 Negro. All rights reserved.
//

import Foundation
import AVFoundation

// TODO: HACER QUE FUNCIONE

struct SoundPlayer {
    static func play(sound: Sound) {
        if let url = Bundle.main.url(forResource: sound.name, withExtension: sound.ext) {
            do {
                let sound = try AVAudioPlayer(contentsOf: url)
                sound.play()
            } catch {
                print("Error: couldn't play the sound file '\(sound.name)'")
            }
        } else {
            print("Error: couldn't find sound file '\(sound.name)'")
        }
    }
}

//
//  TempoClock.swift
//  Sequencer
//
//  Created by Derek Cook on 8/27/21.
//  Copyright © 2021 Derek Cook. All rights reserved.
//

import Foundation

enum timerMode {
    case playing
    case stopped
    case paused
}

struct BlockModel {
    let index: Int
    var soundFile: String = ""
}

class GridModel: ObservableObject {
    @Published var mode: timerMode = .stopped
    @Published var blocks = [[BlockModel]]()
    @Published var index = 0
    @Published var time = "--.--.--"

    private var sixteenths = 0
    private var beats = 0
    private var bars = 0
    private var timer = Timer()
    private var millis: Int = 0

    init() {
        for i in 0...3 {
            var row = [BlockModel]()
            for j in 0...7 {
                let index = j + 8 * i
                row.append(BlockModel(index: index))
            }
            self.blocks.append(row)
        }
    }
    
    func start(tempo: Double) {
        print("starting timer")
        playSound(sound: "Clave BamVin", type: "wav")
        // To get timer interval in terms of SECONDS:
        // tempo = beats/minute aka BPM, sixteenths/minute = BPM
        // sixteenths/second = (BPM * 4) * (1/60)
        // to get seconds/sixteenth, inverse the result
        let secondsPerSixteenth: Double = 1.0 / Double((tempo * 4) * (1 / 60))
        self.timer = Timer.scheduledTimer(withTimeInterval: secondsPerSixteenth, repeats: true) { _ in
            print("timer interval")
            print(self.time)
            self.sixteenths += 1
            self.beats = self.sixteenths / 4
            self.bars = self.beats / 4
            self.time = "\(self.bars).\(self.beats % 4).\(self.sixteenths % 16)"
            if self.sixteenths % 4 == 0 {
                playSound(sound: "Clave BamVin", type: "wav")
            }
            self.index += 1
            if (self.index == 32) {
                self.index = 0
            }
        }
    }

    func pause() {
        print("pausing timer")
        self.timer.invalidate()
    }
    
    func stop() {
        print("stopping timer")
        self.sixteenths = 0
        self.beats = 0
        self.bars = 0
        self.timer.invalidate()
        self.index = 0
        self.time = "--.--.--"
    }
}

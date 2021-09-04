//
//  PlayPauseButton.swift
//  Sequencer
//
//  Created by Derek Cook on 8/26/21.
//  Copyright © 2021 Derek Cook. All rights reserved.
//

import SwiftUI

struct PlayPauseButton: View {
    var mode: timerMode
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(self.mode == .playing ? "Pause" : "Play")
                .foregroundColor(.white)
                .padding(.all, 16)
                .background(Color.blue)
                .cornerRadius(5)
        }
    }
}

struct PlayPauseButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayPauseButton(mode: timerMode.stopped) {
            print("toggled play pause")
        }
    }
}

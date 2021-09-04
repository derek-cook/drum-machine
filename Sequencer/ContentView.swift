//
//  ContentView.swift
//  Sequencer
//
//  Created by Derek Cook on 8/21/21.
//  Copyright © 2021 Derek Cook. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @StateObject var grid: GridModel = GridModel()
    @State var tempo: Double = 120

    func togglePlayPause() {
        if grid.mode == .playing {
            grid.stop()
            grid.mode = .stopped
        } else {
            grid.start(tempo: tempo)
            grid.mode = .playing
        }
    }

    var body: some View {
        GeometryReader { geometry in
            let blockSize = geometry.size.width / 8 - 7
            VStack {
                Spacer()
                Text("Tempo: \(grid.time)")
                VStack {
                    ForEach(0..<4) { i in
                        HStack {
                            ForEach(0..<8) { j in
                                Block(blockData: grid.blocks[i][j], size: blockSize, gridIndex: grid.index)
                            }
                        }
                    }
                }.padding(.all, 4)
                HStack {
                    PlayPauseButton(mode: grid.mode, action: self.togglePlayPause)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

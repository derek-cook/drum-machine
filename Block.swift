//
//  Block.swift
//  Sequencer
//
//  Created by Derek Cook on 8/28/21.
//  Copyright © 2021 Derek Cook. All rights reserved.
//

import SwiftUI

struct Block: View {
    var blockData: BlockModel
    var size: CGFloat
    var gridIndex: Int

    var body: some View {
        let color: Color = gridIndex == blockData.index ? .gray : .blue
        Rectangle()
            .foregroundColor(color)
            .frame(height: size - 4)
    }
}

struct Block_Previews: PreviewProvider {
    static var previews: some View {
        Block(blockData: BlockModel(index: 1), size: 30, gridIndex: 0)
    }
}

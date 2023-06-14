//
//  ContentView.swift
//  Practice003
//
//  Created by npc on 2023/06/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("多摩地区紹介")
                .font(.system(size: 40, weight: .black))
            
            // Assets.xcassetsの画像を表示する
            Image("snow")
            
            
            Text("小山田緑地")
                .font(.system(size: 30))
            
            Text("小山田緑地（おやまだりょくち）は、東京都町田市に所在する都立公園。")
                .multilineTextAlignment(.center)
            
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

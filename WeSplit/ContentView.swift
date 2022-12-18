//
//  ContentView.swift
//  WeSplit
//
//  Created by Nikhil Barik on 18/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    
    var body: some View{
        Button("Tap count: \(tapCount)"){
            tapCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

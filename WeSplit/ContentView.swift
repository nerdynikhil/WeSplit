//
//  ContentView.swift
//  WeSplit
//
//  Created by Nikhil Barik on 18/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    var body: some View{
        Form{
            ForEach(0..<50){
                Text("Line \($0)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

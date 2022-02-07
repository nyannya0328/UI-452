//
//  ContentView.swift
//  UI-452
//
//  Created by nyannyan0328 on 2022/02/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            
            Color.black
                .ignoresSafeArea()
            
            MaterialRainView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

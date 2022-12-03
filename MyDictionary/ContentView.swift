//
//  ContentView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            MainView()
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

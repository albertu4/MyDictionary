//
//  MenuVIew.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 05.12.2022.
//

import SwiftUI

struct MenuVIew: View {
    let title: String
    
    var body: some View {
        Menu(title) {
            Text("check")
        }
    }
}

struct MenuVIew_Previews: PreviewProvider {
    static var previews: some View {
        MenuVIew(title: "tap")
    }
}

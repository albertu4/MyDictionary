//
//  DefinitionView.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 13.12.2022.
//

import SwiftUI

struct DefinitionView: View {
    @State private var definition: Definition?
    
    var body: some View {
        
        VStack {
            List(definition?.results ?? []) { result in
                
                ForEach(result.lexicalEntries ?? []) { lexicalEntry in
                    ForEach(lexicalEntry.entries ?? [], id: \.homographNumber) { entry in
                        
                        SenseView(senses: entry.senses ?? [])
                    }
                }
            }
            Button("tap") {
                fetchDefinitions()
            }
        }
    }
    
    private func fetchDefinitions() {
        NetworkManager.shared.fetchDefinition(word: "swimming", language: "en-gb") { definition in
            self.definition = definition
        }
    }
}


struct DefinitionView_Previews: PreviewProvider {
    static var previews: some View {
        DefinitionView()
    }
}

//
//  Pronunciation.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 04.12.2022.
//

import Foundation

struct Pronunciation: Decodable, Hashable {
    let audioFile: String
    let dialects: [String]
    let phoneticSpelling: String
    
}

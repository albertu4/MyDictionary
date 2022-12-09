//
//  Enter.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 09.12.2022.
//

import Foundation

//struct Enter: Decodable {
//    let homographNumber: String
//    let pronunciations: [Pronounce]
//}

struct Pronounce: Decodable, Hashable {
    let audioFile: String
    let dialects: [String]
}

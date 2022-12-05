////
////  Link.swift
////  MyDictionary
////
////  Created by Михаил Иванов on 04.12.2022.
////
//
//import Foundation
//
//class Link {
//    static let shared = Link()
//    private init() {}
//    
//    let sentences = URL(string: "https://od-api.oxforddictionaries.com:443/api/v2/sentences/\(NetworkManager.shared.language)/\(NetworkManager.shared.word)?strictMatch=false")!
//    
//    let pronunciation = URL(string: "https://od-api.oxforddictionaries.com/api/v2/translations/\(NetworkManager.shared.language)/\(NetworkManager.shared.target_lang_translate)/\(NetworkManager.shared.word)?strictMatch=false")!
//    
//    let translation = URL(string: "https://od-api.oxforddictionaries.com/api/v2/translations/en/ru/ace?strictMatch=false&fields=translations")!
//    
//    let all = URL(string: "https://od-api.oxforddictionaries.com/api/v2/")!
//    
//    let searching = URL(string: "https://od-api.oxforddictionaries.com/api/v2/search/thesaurus/en?q=\(NetworkManager.shared.word)")!
//}

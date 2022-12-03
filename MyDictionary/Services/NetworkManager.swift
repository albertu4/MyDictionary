//
//  NetworkManager.swift
//  MyDictionary
//
//  Created by Михаил Иванов on 03.12.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

//class NetworkManager {
//
//    static let shared = NetworkManager()
//    private init() {}
//
//    func fetchWord(link: Link.RawValue, completion: @escaping (Result<[Word], Error>) -> ()) {
//        guard let url = URL(string: link) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else { return }
//
//            do {
//                let word = try JSONDecoder().decode([Word].self, from: data)
//                completion(.success(word))
//            } catch let error {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//}

///api/v2/translations/{source_lang_translate}/{target_lang_translate}/{word_id}:
////translations/en/ru/ace?strictMatch=false&fields=pronunciations
//
///api/v2/entries/{source_lang}/{word_id}:

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    private let appId = "63af5f08"
    private let appKey = "9074834086355926399c7e0e9af39f74"
    let source_lang_translate = "en"
    let target_lang_translate = "ru"
    let word = "Ace"
    let fields = "pronunciations"
    let strictMatch = "false"
    
    func fetchWord(completion: @escaping(Word) -> ()) {
        
        let word_id = word.lowercased()
        let url = URL(
            string: "https://od-api.oxforddictionaries.com:443/api/v2/translations/\(source_lang_translate)/\(target_lang_translate)/\(word_id)?strictMatch=\(strictMatch)&fields=\(fields)"
        )!
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, _, error in
//            if let data = data,
//               let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
//                print(jsonData)
//            } else {
//                print(error)
//            }
            guard let data = data else {
                print(NetworkError.noData)
                return
            }

            do {
                let word = try JSONDecoder().decode(Word.self, from: data)
                completion(word)
            } catch let error {
                print(NetworkError.decodingError)
                print(error.localizedDescription)
            }
            
        }).resume()
    }
}

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

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    init(word: String) {
        self.word = word.lowercased()
    }
    
    private let appId = "63af5f08"
    private let appKey = "9074834086355926399c7e0e9af39f74"
    private let strictMatch = "false"
    
    let language = "en"
    let target_lang_translate = "ru"
    var word = "Ace"
    let fields = "pronunciations"
    
//    var word_id: String {
//        word.lowercased()
//    }
    
    func fetchWord(url: URL, completion: @escaping(Word) -> ()) {
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, _, error in
            guard let data = data else {
                print(NetworkError.noData)
                return
            }

            do {
                let word = try JSONDecoder().decode(Word.self, from: data)
                completion(word)
                
            } catch let error {
                print("Word", NetworkError.decodingError)
                print(error.localizedDescription)
            }
            
        }).resume()
    }
    
    func fetchSense(url: URL, completion: @escaping([Sense]) -> ()) {
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? NetworkError.noData)
                return
            }
            
            do {
//                let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//                print(jsonData!)
                
                let json = String(data: data, encoding: .utf8)
                guard let jsonData = json?.data(using: .utf8) else { return }
                
                let senses = try JSONDecoder().decode([Sense].self, from: jsonData)
                
                completion(senses)
            } catch let error {
                print("Sense", NetworkError.decodingError)
                print(error.localizedDescription)
            }
            
        }).resume()
    }
    
    func fetchEntry(url: URL, completion: @escaping(Entry) -> ()) {
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? NetworkError.noData)
                return
            }
            
            do {
                let json = String(data: data, encoding: .utf8)
                guard let jsonData = json?.data(using: .utf8) else { return }
                
                let entry = try JSONDecoder().decode(Entry.self, from: jsonData)
                print(entry)
                completion(entry)
            } catch let error {
                print("Entry", NetworkError.decodingError)
                print(error.localizedDescription)
            }
            
        }).resume()
    }
    
    func fetchTranslation(url: URL, completion: @escaping(Translation) -> ()) {
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? NetworkError.noData)
                return
            }
            
            do {
                let json = String(data: data, encoding: .utf8)
                guard let jsonData = json?.data(using: .utf8) else { return }
                
                let translation = try JSONDecoder().decode(Translation.self, from: jsonData)
                
                print(translation)
                
                completion(translation)
            } catch let error {
                print("tranlsation", NetworkError.decodingError)
                print(error.localizedDescription)
            }
            
        }).resume()
    }

}

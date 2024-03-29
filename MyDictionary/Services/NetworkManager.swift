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
    
    private let appId = "113fc935"
    private let appKey = "d1a11fe8fce0559b1955a2424be5dbf4"
    
    func fetch(word: String, fromLanguage: String, toLanguage: String, completion: @escaping(Word) -> ()) {
        
        let wordId = word.lowercased()
        
        guard let url = URL(string: "https://od-api.oxforddictionaries.com/api/v2/translations/\(fromLanguage)/\(toLanguage)/\(wordId)?strictMatch=false")
        else {
            print(NetworkError.invalidURL)
            return
        }
        
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
                DispatchQueue.main.async {
                    completion(word)
                }
                
            } catch let error {
                print("Word", NetworkError.decodingError)
                print(error.localizedDescription)
            }
            
        }).resume()
    }
    
    func fetchSearching(word: String, fromLanguage: String, toLanguage: String, completion: @escaping(Searching) -> ()) {
        
        let wordId = word.lowercased()
        guard let url = URL(string: "https://od-api.oxforddictionaries.com/api/v2/search/translations/\(fromLanguage)/\(toLanguage)?q=\(wordId)")
        else {
            print(NetworkError.invalidURL)
            return
        }
        
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
                let searching = try JSONDecoder().decode(Searching.self, from: data)
                DispatchQueue.main.async {
                    completion(searching)
                }
                
            } catch let error {
                print("Word2", NetworkError.decodingError)
                print(error.localizedDescription)
            }
            
        }).resume()
    }
    
    func fetchPronunciationGB(word: String, language: String, completion: @escaping(PronunciationGB) -> ()) {
        
        let wordId = word.lowercased()
        guard let url = URL(string: "https://od-api.oxforddictionaries.com/api/v2/entries/\(language)/\(wordId)?fields=pronunciations&strictMatch=false")
        else {
            print(NetworkError.invalidURL)
            return
        }
        
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
                let pronunciation = try JSONDecoder().decode(PronunciationGB.self, from: data)
                DispatchQueue.main.async {
                    completion(pronunciation)
                }
                
            } catch let error {
                print("Word2", NetworkError.decodingError)
                print(error.localizedDescription)
            }
            
        }).resume()
    }
    
    func fetchDefinition(word: String, language: String, completion: @escaping(Definition) -> ()) {
        
        let wordId = word.lowercased()
        guard let url = URL(string: "https://od-api.oxforddictionaries.com/api/v2/words/\(language)?q=\(wordId)")
                
        else {
            print(NetworkError.invalidURL)
            return
        }
        
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
                
                let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(jsonData!)
                
                let definition = try JSONDecoder().decode(Definition.self, from: data)
                DispatchQueue.main.async {
                    completion(definition)
                }
                
            } catch let error {
                print("Definition", NetworkError.decodingError)
                print(error.localizedDescription)
            }
            
        }).resume()
    }

    
   
    
    //                let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    //                print(jsonData!)
}

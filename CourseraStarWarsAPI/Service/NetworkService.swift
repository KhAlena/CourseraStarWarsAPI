//
//  NetworkService.swift
//  CourseraStarWarsAPI
//
//  Created by Alena Khadieva on 23.04.2020.
//  Copyright © 2020 Alena Khadieva. All rights reserved.
//


import Foundation
class NetworkService {
    static let shared = NetworkService()
    
    
    
    
    let session = URLSession(configuration: .default)
    func getCharacters(APIurl: String, onSuccess: @escaping (People) -> Void, onError: @escaping (String) -> Void) {
        let url = URL(string: APIurl)!
        let task = session.dataTask(with: url) {(data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                guard let data = data, let response = response as? HTTPURLResponse else {
                    onError("Invalid data or response")
                    return
                }
                do {
                    if response.statusCode == 200 {
                        let people = try JSONDecoder().decode(People.self, from: data)
                        onSuccess(people)
                    } else {
                        onError("Status code of server \(response.statusCode)")
                    } }
                catch {
                    onError(error.localizedDescription)
                    }
                
            }
            

        }
        
        task.resume()
        
    }
}

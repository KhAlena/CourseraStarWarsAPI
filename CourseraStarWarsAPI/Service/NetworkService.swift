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
    func getData(APIurl: String, modelType: String, onSuccess: @escaping (Any) -> Void, onError: @escaping (String) -> Void)  {
        
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
                        switch modelType {
                        case "people":
                            let data = try JSONDecoder().decode(DataCharacter.self, from: data)
                            onSuccess(data)
                        case "planets":
                            let data = try JSONDecoder().decode(DataPlanets.self, from: data)
                            onSuccess(data)
                        case "films":
                            let data = try JSONDecoder().decode(DataFilms.self, from: data)
                            onSuccess(data)
                        case "species":
                            let data = try JSONDecoder().decode(DataSpecies.self, from: data)
                            onSuccess(data)
                        case "vehicles":
                            let data = try JSONDecoder().decode(DataVehicles.self, from: data)
                            onSuccess(data)
                        case "starships":
                            let data = try JSONDecoder().decode(DataStarships.self, from: data)
                            onSuccess(data)
                        default:
                            return
                        }
                        
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

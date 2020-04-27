//
//  Species.swift
//  CourseraStarWarsAPI
//
//  Created by Alena Khadieva on 26.04.2020.
//  Copyright © 2020 Alena Khadieva. All rights reserved.
//

import Foundation

struct Species: Codable {
    let name: String
    let classification: String
    let designation: String
    let average_height: String
    let skin_colors: String
    let hair_colors: String
    let eye_colors: String
    let average_lifespan: String
    let homeworld: String?
    let language: String
    let people: Array<String>
    let films: Array<String>
    let created: String
    let edited: String
    let url: String
    
}




struct DataSpecies: Codable {
    let count: Int
    var next: String?
    let previous: String?
    var results: Array<Species>
}

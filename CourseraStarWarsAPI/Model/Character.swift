//
//  Character.swift
//  CourseraStarWarsAPI
//
//  Created by Alena Khadieva on 23.04.2020.
//  Copyright © 2020 Alena Khadieva. All rights reserved.
//

import Foundation

struct Character: Codable {
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
    var films: Array<String>
    let species: Array<String>
    let vehicles: Array<String>
    let starships: Array<String>
    let created: String
    let edited: String
    let url: String
}

struct DataCharacter: Codable {
    let count: Int
    var next: String?
    let previous: String?
    var results: Array<Character>
}


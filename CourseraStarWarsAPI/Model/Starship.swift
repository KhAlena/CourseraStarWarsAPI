//
//  Starship.swift
//  CourseraStarWarsAPI
//
//  Created by Alena Khadieva on 26.04.2020.
//  Copyright © 2020 Alena Khadieva. All rights reserved.
//

import Foundation
struct Starship: Codable {
    let name: String
    let model: String
    let manufacturer: String
    let cost_in_credits: String
    let length: String
    let max_atmosphering_speed: String
    let crew: String
    let passengers: String
    let cargo_capacity: String
    let consumables: String
    let hyperdrive_rating: String
    let MGLT: String
    let starship_class: String
    let pilots: Array<String>
    let films: Array<String>
    let created: String
    let edited: String
    let url: String
}

struct DataStarships: Codable {
    let count: Int
    var next: String?
    let previous: String?
    var results: Array<Starship>
}

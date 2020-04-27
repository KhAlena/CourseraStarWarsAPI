//
//  Planet.swift
//  CourseraStarWarsAPI
//
//  Created by Alena Khadieva on 24.04.2020.
//  Copyright © 2020 Alena Khadieva. All rights reserved.
//

import Foundation
struct Planet: Codable {
    let name: String
    let rotation_period: String
    let orbital_period: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surface_water: String
    let population: String
    let residents: Array<String>
    let films: Array<String>
    let created: String
    let edited: String
    let url: String
}

struct DataPlanets: Codable {
    let count: Int
    var next: String?
    let previous: String?
    var results: Array<Planet>
}

//
//  Vehicle.swift
//  CourseraStarWarsAPI
//
//  Created by Alena Khadieva on 26.04.2020.
//  Copyright © 2020 Alena Khadieva. All rights reserved.
//

import Foundation

struct Vehicle: Codable {
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
    let vehicle_class: String
    let pilots: Array<String>
    let films: Array<String>
    let created: String
    let edited: String
    let url: String
    
}

struct DataVehicles: Codable {
    let count: Int
    var next: String?
    let previous: String?
    var results: Array<Vehicle>
}

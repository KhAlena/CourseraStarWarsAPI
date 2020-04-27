//
//  Film.swift
//  CourseraStarWarsAPI
//
//  Created by Alena Khadieva on 24.04.2020.
//  Copyright © 2020 Alena Khadieva. All rights reserved.
//

import Foundation

struct Film: Codable {
    let title: String
    let episode_id: Int
    let opening_crawl: String
    let director: String
    let producer: String
    let release_date: String
    let characters: Array<String>
    let planets: Array<String>
    let starships: Array<String>
    let vehicles: Array<String>
    let species: Array<String>
    let created: String
    let edited: String
    let url: String
}
struct DataFilms: Codable {
    let count: Int
    var next: String?
    let previous: String?
    var results: Array<Film>
}


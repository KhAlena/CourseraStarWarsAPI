//
//  Data.swift
//  CourseraStarWarsAPI
//
//  Created by Alena Khadieva on 26.04.2020.
//  Copyright © 2020 Alena Khadieva. All rights reserved.
//

import Foundation

struct DataCharacter: Codable {
    let count: Int
    var next: String?
    let previous: String?
    var results: Array<Character>
}

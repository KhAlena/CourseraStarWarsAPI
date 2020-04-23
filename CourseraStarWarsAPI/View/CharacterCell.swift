//
//  CharacterCell.swift
//  CourseraStarWarsAPI
//
//  Created by Alena Khadieva on 23.04.2020.
//  Copyright © 2020 Alena Khadieva. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    
    func updateCell(character: Character) {
        nameLbl.text = character.name
    }

    
    
    
}

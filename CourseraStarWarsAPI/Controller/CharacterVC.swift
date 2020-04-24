//
//  ChatacterVC.swift
//  CourseraStarWarsAPI
//
//  Created by Alena Khadieva on 24.04.2020.
//  Copyright © 2020 Alena Khadieva. All rights reserved.
//

import UIKit

class CharacterVC: UIViewController {
    
    @IBOutlet weak var nameCharacterLbl: UILabel!
    
    var character = Character(name: "", height: "", mass: "", hair_color: "", skin_color: "", eye_color: "", birth_year: "", gender: "", homeworld: "", films:[], species: [], vehicles: [], starships: [], created: "", edited: "", url: "")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameCharacterLbl.text = character.name
        
        }

    
    func initCharacter (character: Character) {
        self.character = character
    }
    
    

    
    
    
    }

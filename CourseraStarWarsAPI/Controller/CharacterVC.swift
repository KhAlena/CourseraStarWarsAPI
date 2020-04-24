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
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairColorLbl: UILabel!
    @IBOutlet weak var skinColorLbl: UILabel!
    @IBOutlet weak var eyeColorLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var homeworldLbl: UIButton!
    @IBOutlet weak var filmsLbl: UILabel!
    @IBOutlet weak var speciesLbl: UILabel!
    @IBOutlet weak var vehiclesLbl: UILabel!
    @IBOutlet weak var starshipsLbl: UILabel!
    @IBOutlet weak var createdLbl: UILabel!
    @IBOutlet weak var editedLbl: UILabel!
    @IBOutlet weak var urlLbl: UILabel!
    
    
    
    var character: Character!
    
    var planet: Planet!
    
    func getPlanetInfo(_ url: String) {
        NetworkService.shared.getData(APIurl: url, modelType: "planet", onSuccess: { (planet) in
            self.planet = (planet as! Planet)
            self.homeworldLbl.setTitle(self.planet.name, for: .normal)
        }) { (errormessage) in
            print(errormessage)
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPlanetInfo(character.homeworld)
        
        nameCharacterLbl.text = character.name.uppercased()
        nameLbl.text = character.name
        heightLbl.text = character.height
        massLbl.text = character.mass
        hairColorLbl.text = character.hair_color
        skinColorLbl.text = character.skin_color
        eyeColorLbl.text = character.eye_color
        birthYearLbl.text = character.birth_year
        genderLbl.text = character.gender
        filmsLbl.text = "soon"
        speciesLbl.text = "soon"
        vehiclesLbl.text = "soon"
        starshipsLbl.text = "soon"
        createdLbl.text = character.created
        editedLbl.text = character.edited
        urlLbl.text = character.url
        
        }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let planetVC = segue.destination as? PlanetVC {
            planetVC.planetInfo = self.planet
        }
        
    }
    
    

    
    
    
    }

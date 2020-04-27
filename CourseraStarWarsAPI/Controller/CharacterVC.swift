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
    var planetsDict: [String:Planet] = [:]
    var filmDict: [String:Film] = [:]
    var speciesDict: [String:Species] = [:]
    var starshipsDict: [String:Starship] = [:]
    var vehiclesDict: [String:Vehicle] = [:]
    
    var planet: Planet!
    var filmTitles : [String] = []
    var vehiclesNames: [String] = []
    var starshipNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        planet = planetsDict[character.homeworld]
        filmTitles = character.films.map {  filmDict[$0]!.title }
        filmsLbl.text = filmTitles.joined(separator: "\n")
        vehiclesNames = character.vehicles.map { vehiclesDict[$0]!.name }
        if vehiclesNames.count > 0 {
            vehiclesLbl.text = vehiclesNames.joined(separator: "\n")
        } else { vehiclesLbl.text = "unknown" }
        starshipNames = character.starships.map { starshipsDict[$0]!.name }
        if starshipNames.count > 0 {
            starshipsLbl.text = starshipNames.joined(separator: "\n")
        } else { starshipsLbl.text = "unknown "}
        nameCharacterLbl.text = character.name.uppercased()
        heightLbl.text = character.height
        massLbl.text = character.mass
        hairColorLbl.text = character.hair_color
        skinColorLbl.text = character.skin_color
        eyeColorLbl.text = character.eye_color
        birthYearLbl.text = character.birth_year
        genderLbl.text = character.gender
        homeworldLbl.setTitle(planet.name, for: .normal)
        if character.species.count > 0 {
            speciesLbl.text = speciesDict[character.species[0]]!.name
        } else { speciesLbl.text = "unknown" }
        createdLbl.text = character.created
        editedLbl.text = character.edited
        urlLbl.text = character.url
        }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let planetVC = segue.destination as? PlanetVC {
            planetVC.planetInfo = self.planet
            planetVC.filmDict = self.filmDict
        }
        
    }
    
    
    
    }

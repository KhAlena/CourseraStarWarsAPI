//
//  PlanetVC.swift
//  CourseraStarWarsAPI
//
//  Created by Alena Khadieva on 24.04.2020.
//  Copyright © 2020 Alena Khadieva. All rights reserved.
//

import UIKit

class PlanetVC: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var rotationLbl: UILabel!
    @IBOutlet weak var orbitalLbl: UILabel!
    @IBOutlet weak var diameterLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var gravityLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var waterLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    @IBOutlet weak var filmsLbl: UILabel!
    @IBOutlet weak var createdLbl: UILabel!
    @IBOutlet weak var editedLbl: UILabel!
    @IBOutlet weak var urlLbl: UILabel!
    
    
    
    var planetInfo: Planet!
    var filmDict: [String:Film] = [:]
    var filmTitles : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        filmTitles = planetInfo.films.map {  filmDict[$0]!.title }
        titleLbl.text = planetInfo.name.uppercased()
        rotationLbl.text = planetInfo.rotation_period
        orbitalLbl.text = planetInfo.orbital_period
        diameterLbl.text = planetInfo.diameter
        climateLbl.text = planetInfo.climate
        gravityLbl.text = planetInfo.gravity
        terrainLbl.text = planetInfo.terrain
        waterLbl.text = planetInfo.surface_water
        populationLbl.text = planetInfo.population
        filmsLbl.text = filmTitles.joined(separator: "\n")
        createdLbl.text = planetInfo.created
        editedLbl.text = planetInfo.edited
        urlLbl.text = planetInfo.url
        
    }
    

}

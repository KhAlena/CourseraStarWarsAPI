//
//  ViewController.swift
//  CourseraStarWarsAPI
//
//  Created by Alena Khadieva on 23.04.2020.
//  Copyright © 2020 Alena Khadieva. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var characterTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var people = Array<Character>()
    var peopleFiltered = Array<Character>()
    var peopleDict: [String:Character] = [:]
    var planets = Array<Planet>()
    var planetsDict: [String:Planet] = [:]
    var films = Array<Film>()
    var filmDict: [String:Film] = [:]
    var species = Array<Species>()
    var speciesDict: [String:Species] = [:]
    var vehicles = Array<Vehicle>()
    var vehiclesDict: [String:Vehicle] = [:]
    var starships = Array<Starship>()
    var starshipsDict: [String:Starship] = [:]
    
    var nextUrl: String?
    
    let URL_BASE = "http://swapi.dev/api"
    let URL_PEOPLE = "/people"
    let URL_PLANETS = "/planets"
    let URL_FILMS = "/films"
    let URL_SPECIES = "/species"
    let URL_VEHICLES = "/vehicles"
    let URL_STARSHIPS = "/starships"
    
    func getCharacters(_ url: String) {
        NetworkService.shared.getData(APIurl: url, modelType: "people", onSuccess: { (people)  in
            if let people = people as? DataCharacter {
                self.people.append(contentsOf: people.results)
                if people.next != nil {
                    self.nextUrl = people.next!
                    self.getCharacters(self.nextUrl!)
                    }
                self.characterTable.reloadData()
                self.peopleFiltered = self.people
                for character in self.people {
                    self.peopleDict[character.url] = character
                }
            }
        }) { (errormessage) in
                print(errormessage)
        }
    }

    func getPlanets(_ url: String) {
        NetworkService.shared.getData(APIurl: url, modelType: "planets", onSuccess: { (planets) in
            if let planets = planets as? DataPlanets {
                self.planets.append(contentsOf: planets.results)
                if planets.next != nil {
                    self.nextUrl = planets.next!
                    self.getPlanets(self.nextUrl!)
                }
                for planet in self.planets {
                    self.planetsDict[planet.url] = planet
                }
            }
        }) { (errormessage) in
            print(errormessage)
        }
    }
    
    func getFilms(_ url: String) {
        NetworkService.shared.getData(APIurl: url, modelType: "films", onSuccess: { (films) in
            if let films = films as? DataFilms {
                self.films.append(contentsOf: films.results)
                if films.next != nil {
                    self.nextUrl = films.next!
                    self.getFilms(self.nextUrl!)
                }
                for film in self.films {
                    self.filmDict[film.url] = film
                }
            }
            
        }) { (errormessage) in
            print(errormessage)
        }
    }
    
    func getSpecies(_ url: String) {
        NetworkService.shared.getData(APIurl: url, modelType: "species", onSuccess: { (species) in
            if let species = species as? DataSpecies {
                self.species.append(contentsOf: species.results)
                if species.next != nil {
                    self.nextUrl = species.next!
                    self.getSpecies(self.nextUrl!)
                }
                for specie in self.species {
                    self.speciesDict[specie.url] = specie
                }
            }
        }) { (errormessage) in
            print(errormessage)
        }
    }
    
    func getVehicles (_ url: String) {
        NetworkService.shared.getData(APIurl: url, modelType: "vehicles", onSuccess: { (vehicles) in
            if let vehicles = vehicles as? DataVehicles {
                self.vehicles.append(contentsOf: vehicles.results)
                if vehicles.next != nil {
                    self.nextUrl = vehicles.next!
                    self.getVehicles(self.nextUrl!)
                }
                for vehicle in self.vehicles {
                    self.vehiclesDict[vehicle.url] = vehicle
                }
            }
        }) { (errormessage) in
            print(errormessage)
        }
    }
    
    func getStarships(_ url: String) {
        NetworkService.shared.getData(APIurl: url, modelType: "starships", onSuccess: { (starships) in
            if let starships = starships as? DataStarships {
                self.starships.append(contentsOf: starships.results)
                if starships.next != nil {
                    self.nextUrl = starships.next!
                    self.getStarships(self.nextUrl!)
                }
                for starship in self.starships {
                    self.starshipsDict[starship.url] = starship
                }
            }
        }) { (errormessage) in
            print(errormessage)
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        characterTable.dataSource = self
        characterTable.delegate = self
        searchBar.delegate = self
        getCharacters("\(URL_BASE)\(URL_PEOPLE)")
        getPlanets("\(URL_BASE)\(URL_PLANETS)")
        getFilms("\(URL_BASE)\(URL_FILMS)")
        getSpecies("\(URL_BASE)\(URL_SPECIES)")
        getVehicles("\(URL_BASE)\(URL_VEHICLES)")
        getStarships("\(URL_BASE)\(URL_STARSHIPS)")
        
        
        
        
        
        
    }
}


extension MainVC: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleFiltered.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as? CharacterCell {
            cell.updateCell(character: peopleFiltered[indexPath.row])
            let backgroundView = UIView()
            backgroundView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1205586473)
            cell.selectedBackgroundView = backgroundView
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = peopleFiltered[indexPath.row]
        performSegue(withIdentifier: "CharacterVC", sender: character)
    }
     
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        peopleFiltered = searchText.isEmpty ? people : people.filter({ (character: Character) -> Bool in
            return character.name.contains(searchText)
        })
        characterTable.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let characterVC = segue.destination as? CharacterVC {
            assert(sender as? Character != nil)
            characterVC.character = sender as? Character
            characterVC.planetsDict = self.planetsDict
            characterVC.filmDict = self.filmDict
            characterVC.speciesDict = self.speciesDict
            characterVC.vehiclesDict = self.vehiclesDict
            characterVC.starshipsDict = self.starshipsDict
        }
    }
    
    
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

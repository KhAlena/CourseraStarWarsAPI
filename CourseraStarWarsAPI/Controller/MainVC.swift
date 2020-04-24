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
    
    var people = Array<Character>()
    var nextUrl: String?
    let URL_BASE = "http://swapi.dev/api"
    let URL_PEOPLE = "/people"
    
    func getCharacters(_ url: String) {
        DispatchQueue.main.async {
            NetworkService.shared.getCharacters(APIurl: url, onSuccess: { (people) in
                self.people.append(contentsOf: people.results)
                if people.next != nil {
                    self.nextUrl = people.next!
                    self.getCharacters(self.nextUrl!)
                    }
                self.characterTable.reloadData()
                
            }) { (errormessage) in
                print(errormessage)
                }
            
        }
        
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        characterTable.dataSource = self
        characterTable.delegate = self
        getCharacters("\(URL_BASE)\(URL_PEOPLE)")
        
        
        
    }
}


extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as? CharacterCell {
            cell.updateCell(character: people[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = people[indexPath.row]
        performSegue(withIdentifier: "CharacterVC", sender: character)
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let characterVC = segue.destination as? CharacterVC {
            assert(sender as? Character != nil)
            characterVC.initCharacter(character: sender as! Character)
        }
    }
    
    
}



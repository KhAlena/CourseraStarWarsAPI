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
    
    func getCharacters() {
        NetworkService.shared.getCharacters(onSuccess: { (people) in
            self.people = people.results
            self.characterTable.reloadData()
        }) { (errormessage) in
            print(errormessage)
            }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        characterTable.dataSource = self
        characterTable.delegate = self
        getCharacters()
        
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
    
    
}



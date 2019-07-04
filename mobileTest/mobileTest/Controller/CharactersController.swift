//
//  CharactersController.swift
//  mobileTest
//
//  Created by CtanLI on 2019-07-04.
//  Copyright © 2019 guestlogix. All rights reserved.
//

import UIKit

class CharactersController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    let cellId = "CharactersCell"
    private var charactersDetailController = "CharacterDetailController"
    var charactersArray: [String]?
    var characterDetails: CharactersViewModel?
    var characterArray = [Characters.payLoad]()
    var characterViewModels = [CharactersViewModel]() 
    @IBOutlet weak var characterTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacters()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        characterArray.removeAll()
    }
    
    func getCharacters() {
        for character in charactersArray! {
            APIManager.shared.dataManagerCall(method: .get, urlString: character, params: nil, headers: nil) {  [weak self] (verify: Characters.payLoad) in
                self?.characterArray.append(verify)
                let characterValue = self?.characterArray
                self?.characterViewModels = characterValue?.map({return CharactersViewModel(character: $0)}) ?? []
                self?.characterTable.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CharactersCell
        let characterViewModel = characterViewModels[indexPath.row]
        cell.characterViewModel = characterViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        characterDetails = characterViewModels[indexPath.row]
        self.performSegue(withIdentifier: charactersDetailController, sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == charactersDetailController {
            let characterDetail = segue.destination as? CharacterDetailController
            characterDetail?.characterDetails = characterDetails
        }
    }
}

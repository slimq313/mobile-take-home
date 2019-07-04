//
//  CharactersController.swift
//  mobileTest
//
//  Created by CtanLI on 2019-07-04.
//  Copyright © 2019 guestlogix. All rights reserved.
//

import UIKit

class CharactersController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    // MARK: - Properties
    
    let cellId = "CharactersCell"
    var characterArray = [Characters.payLoad]()
    var charactersArray: [String]?
    private var charactersDetailController = "CharacterDetailController"
    fileprivate  var characterDetails: CharactersViewModel?
    fileprivate var characterViewModels = [CharactersViewModel]()
    
    // MARK: - Outlets
    
    @IBOutlet weak var characterTable: UITableView!
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacters()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        characterArray.removeAll()
    }
    
    // MARK: - Implementations
    
    private func getCharacters() {
        for character in charactersArray! {
            APIManager.shared.dataManagerCall(method: .get, urlString: character, params: nil, headers: nil) {  [weak self] (verify: Characters.payLoad) in
                self?.characterArray.append(verify)
                let characterValue = self?.characterArray
                self?.characterViewModels = characterValue?.map({return CharactersViewModel(character: $0)}) ?? []
                self?.characterTable.reloadData()
            }
        }
    }
    
    // MARK: - Delegates
    
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

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            characterTable.beginUpdates()
            characterViewModels.remove(at: indexPath.row)
            characterTable.deleteRows(at: [indexPath], with: .automatic)
            characterTable.endUpdates()
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == charactersDetailController {
            let characterDetail = segue.destination as? CharacterDetailController
            characterDetail?.characterDetails = characterDetails
        }
    }
}

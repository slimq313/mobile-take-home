//
//  ViewController.swift
//  mobileTest
//
//  Created by CtanLI on 2019-07-04.
//  Copyright © 2019 guestlogix. All rights reserved.
//

import UIKit

class EpisodeController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var episodeTableView: UITableView!

    var charactersArray: [String]?
    var episodeViewModels = [EpisodeViewModel]() 
    let cellId = "EpisodeCell"
    private var charactersController = "CharactersController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getEpisodes()
    }
    
    func getEpisodes() {
        let episodeUrl = BaseAPIClient.urlFromPath(path: APIEndPoints.constants.getEpisode)
        APIManager.shared.dataManagerCall(method: .get, urlString: episodeUrl, params: nil, headers: nil) { [weak self] (verify: Episode.payLoad) in
            let episodes = verify.results
            let _ = episodes.map { values in
                self?.episodeViewModels = values.map({return EpisodeViewModel(epd: $0)})
            }
            self?.episodeTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EpisodeCell
        let episodeViewModel = episodeViewModels[indexPath.row]
        cell.episodeViewModel = episodeViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        charactersArray = episodeViewModels[indexPath.row].characters
        self.performSegue(withIdentifier: charactersController, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == charactersController {
            let characters = segue.destination as? CharactersController
            characters?.charactersArray = charactersArray
        }
    }
}


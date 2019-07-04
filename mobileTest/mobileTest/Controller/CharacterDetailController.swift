//
//  CharacterDetailController.swift
//  mobileTest
//
//  Created by CtanLI on 2019-07-04.
//  Copyright © 2019 guestlogix. All rights reserved.
//

import UIKit

class CharacterDetailController: UIViewController {

    var characterDetails: CharactersViewModel?
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var dateCreated: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDetailUI()
    }
    
    func updateDetailUI() {
        name.text = characterDetails?.name
        status.text = characterDetails?.status
        gender.text = characterDetails?.gender
        characterImage.loadImageUsingCacheWithURLString(urlString: characterDetails?.image ?? "")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-dd-MM'T'HH:mm:ss.SSSZ"
        let dateValue = formatter.date(from: characterDetails?.created ?? "")
        
        formatter.dateFormat = "yyyy-dd-MM"
        let stringValue = formatter.string(from: dateValue ?? Date())
        dateCreated.text = stringValue
    }
}

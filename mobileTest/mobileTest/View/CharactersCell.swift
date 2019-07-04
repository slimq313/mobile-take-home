//
//  CharactersCell.swift
//  mobileTest
//
//  Created by CtanLI on 2019-07-04.
//  Copyright © 2019 guestlogix. All rights reserved.
//

import UIKit

class CharactersCell: UITableViewCell {

    // MARK: - Overrides
    
    fileprivate var status = "Alive"
    
    // MARK: - Outlets
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var characterStatus: UILabel!
    
    // MARK: - Operations
    
    var characterViewModel: CharactersViewModel! {
        didSet {
            name.text = characterViewModel.name
            characterStatus.text = characterViewModel.status
            
            if characterViewModel.status == status {
                name.textColor = .green
            } else {
                name.textColor = .red
            }
        }
    }
    
    // MARK: - Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

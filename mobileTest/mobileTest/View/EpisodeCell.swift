//
//  EpisodeCell.swift
//  mobileTest
//
//  Created by CtanLI on 2019-07-04.
//  Copyright © 2019 guestlogix. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var episode: UILabel!
    
    var episodeViewModel: EpisodeViewModel! {
        didSet {
            name.text = episodeViewModel.name
            episode.text = episodeViewModel.episode
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

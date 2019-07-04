//
//  EpisodeViewModel.swift
//  mobileTest
//
//  Created by CtanLI on 2019-07-04.
//  Copyright © 2019 guestlogix. All rights reserved.
//

import Foundation
import UIKit

struct EpisodeViewModel {
    
    var id: Int?
    var name: String?
    var episode: String?
    var characters: [String]?

    // Dependency Injection (DI)
    init(epd: Episode.results) {
        self.id = epd.id ?? 0
        self.name = epd.name ?? ""
        self.episode = epd.episode ?? ""
        self.characters = epd.characters ?? []
    }
}

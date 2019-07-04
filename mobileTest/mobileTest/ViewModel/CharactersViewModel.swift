//
//  CharactersViewModel.swift
//  mobileTest
//
//  Created by CtanLI on 2019-07-04.
//  Copyright © 2019 guestlogix. All rights reserved.
//

import Foundation
import UIKit

struct CharactersViewModel {
    
    var name: String?
    var status: String?
    var image: String?
    var gender: String?
    var created: String?
    var origin: String?
    
    // Dependency Injection (DI)
    init(character: Characters.payLoad) {
        self.name = character.name ?? ""
        self.status = character.status ?? ""
        self.image = character.image ?? ""
        self.gender = character.gender ?? ""
        self.created = character.created ?? ""
        self.origin = character.origin?.name ?? ""
        self.origin = character.origin?.url ?? ""
    }
}

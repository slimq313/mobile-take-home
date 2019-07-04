//
//  Characters.swift
//  mobileTest
//
//  Created by CtanLI on 2019-07-04.
//  Copyright © 2019 guestlogix. All rights reserved.
//

import Foundation

class Characters {
    struct payLoad: Decodable {
        let id: Int?
        let name: String?
        let status: String?
        let species: String?
        let type: String?
        let gender: String?
        let image: String?
        let url: String?
        let created: String?
        let origin: origin?
        let location: location?
        let episode: [String]?
    }
    
    struct origin: Decodable {
        let name: String?
        let url: String?
    }
    
    struct location: Decodable {
        let name: String?
        let url: String?
    }
}



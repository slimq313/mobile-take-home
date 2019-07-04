//
//  Episode.swift
//  mobileTest
//
//  Created by CtanLI on 2019-07-04.
//  Copyright © 2019 guestlogix. All rights reserved.
//

import Foundation

class Episode {
    struct payLoad: Decodable {
        let info: info?
        let results: [results]?
    }

    struct info: Decodable {
         let count: Int?
         let pages: Int?
         let next: String?
         let prev: String?
    }

    struct results: Decodable {
        let id: Int?
        let name: String?
        let air_date: String?
        let episode: String?
        let characters: [String]?
        let url: String?
        let created: String?
    }
}




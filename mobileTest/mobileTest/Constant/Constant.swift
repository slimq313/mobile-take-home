//
//  Constant.swift
//  mobileTest
//
//  Created by CtanLI on 2019-07-04.
//  Copyright © 2019 guestlogix. All rights reserved.
//

import Foundation

class BaseAPIClient {
    class func urlFromPath(path: String) -> String {
        let del = "https://rickandmortyapi.com/api"
        if (del == "") {
            return ""
        }
        let requestUrl = String(format: "%@%@", del, path)
        return requestUrl
    }
}

struct APIEndPoints {
    struct constants {
        //
        //API paths...
        //
        
        //Episodes
        static let getEpisode = "/episode"

    }
}

//
//  mobileTestTests.swift
//  mobileTestTests
//
//  Created by CtanLI on 2019-07-04.
//  Copyright © 2019 guestlogix. All rights reserved.
//

import XCTest
@testable import mobileTest

class mobileTestTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEpisodeViewModel() {
        let episode = Episode.results(id: 0, name: "My episode name", air_date: "", episode: "", characters: ["character list"], url: "", created: "")
        let episodeViewModel = EpisodeViewModel(epd: episode)
        
        XCTAssertEqual(episode.name, episodeViewModel.name)
        XCTAssertEqual(episode.characters, episodeViewModel.characters)

    }
    
    func testCharactersViewModel() {
        let character = Characters.payLoad(id: 0, name: "Centaur", status: "Unknown", species: "", type: "", gender: "Male", image: "", url: "", created: "", origin: Characters.origin.init(name: "", url: "www.google.com"), location: Characters.location.init(name: "", url: ""), episode: [])
        let characterViewModel = CharactersViewModel(character: character)
        
        XCTAssertEqual(character.name, characterViewModel.name)
        XCTAssertEqual(character.status, characterViewModel.status)
        XCTAssertEqual(character.origin?.url, characterViewModel.origin)
    }
}

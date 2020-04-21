//
//  ProjectTests.swift
//  NikeMusicSearchTests
//
//  Created by Bharani Cherukuri on 4/21/20.
//  Copyright © 2020 Bharani.Cherukuri. All rights reserved.
//

import XCTest
@testable import NikeMusicSearch

class ProjectTests: XCTestCase {

    func testProjectCreation() {
        let data = dataFrom(filename: "Response")
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let project = try! decoder.decode(InitialData.self, from: data)
        
        XCTAssertEqual(project.feed.results.first?.artistName, "Lady Gaga")
        XCTAssertEqual(project.feed.results.first?.name, "Chromatica")
        XCTAssertEqual(project.feed.results.first?.copyright, "2020 Interscope Records")
        XCTAssertEqual(project.feed.results.first?.releaseDate, "2020-04-10")
    }

}

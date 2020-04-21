//
//  NikeMusicSearchTests.swift
//  NikeMusicSearchTests
//
//  Created by Bharani Cherukuri on 4/20/20.
//  Copyright © 2020 Bharani.Cherukuri. All rights reserved.
//

import XCTest
@testable import NikeMusicSearch

class NikeMusicSearchTests: XCTestCase {

    var viewControllerUnderTest: MusicViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}

extension XCTestCase {
    func dataFrom(filename: String) -> Data {
        let path = Bundle(for: NikeMusicSearchTests.self).path(forResource: filename, ofType: "json")!
        return NSData(contentsOfFile: path)! as Data
    }
}

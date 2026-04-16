//
//  CVS_Code_ChallengeTests.swift
//  CVS-Code-ChallengeTests
//
//  Created by Bernie Cartin on 4/16/26.
//

import XCTest
@testable import CVS_Code_Challenge

final class CVS_Code_ChallengeTests: XCTestCase {
    
    let networkService: any NetworkServiceProtocol
    var sut: HomeViewModel
    
    override init() {
        super.init()
        self.networkService = NetworkServiceMock()
        //MARK: Not sure why i'm getting an error here, NetworkServiceMock clearly confors to NetworkServiceProtocol.
        sut = HomeViewModel(networkService: networkService)
    }

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor func testExample() throws {
        sut.searchText = "rick"
        let results = sut.results
        XCTAssertFalse(results.isEmpty)
        XCTAssertEqual(results.count, 2)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

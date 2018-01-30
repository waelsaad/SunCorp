//
//  SunCorpTestTests.swift
//  SunCorpTestTests
//
//  Created by X on 1/29/18.
//  Copyright © 2018 NetTrinity. All rights reserved.
//

import XCTest
@testable import SunCorpTest

class SunCorpTestTests: XCTestCase {
    
    var viewListModel: TransactionListViewModel!
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    var transactionListVC: TransactionListTableViewController!
    
    override func setUp() {
        
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.transactionListVC = storyboard.instantiateViewController(withIdentifier: "TransactionListTableViewController") as?  TransactionListTableViewController ?? TransactionListTableViewController()
        
        //self.transactionListVC.setupViewModel(user: user)
        self.viewListModel = self.transactionListVC.viewModel
        
        let _ = self.transactionListVC?.view
    }
    
    func testNetworkURL() {
        // given
        let url = URL(string: Constants.base_url)!
        // 1
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        // when
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            // 2
            promise.fulfill()
        }
        dataTask.resume()
        // 3
        waitForExpectations(timeout: 5, handler: nil)
        
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }

    
    func testTotalBalance() {
        //XCTAssertEqual(self.transactionListVC.viewModel.getTotalBalance(), 575.15)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

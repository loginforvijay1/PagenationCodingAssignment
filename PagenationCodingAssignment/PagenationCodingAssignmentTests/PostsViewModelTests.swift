//
//  PostsViewModelTests.swift
//  PagenationCodingAssignmentTests
//
//  Created by Vijay Reddy on 28/05/24.
//

import XCTest

@testable import PagenationCodingAssignment

class PostsViewModelTests: XCTestCase {

    var viewModel: PostsViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = PostsViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testInitialValues() {
        XCTAssertEqual(viewModel.numberOfPosts(), 0, "Initial number of posts should be zero")
    }

    func testLoadPosts() {
        let expectation = self.expectation(description: "Data loaded")
        
        viewModel.onDataUpdated = {
            XCTAssertGreaterThan(self.viewModel.numberOfPosts(), 0, "Posts should be loaded")
            expectation.fulfill()
        }
        
        viewModel.loadPosts()
        
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testLoadMorePosts() {
        let expectation = self.expectation(description: "More data loaded")
        
        viewModel.onDataUpdated = {
            if self.viewModel.numberOfPosts() > 0 {
                self.viewModel.onDataUpdated = {
                    XCTAssertGreaterThan(self.viewModel.numberOfPosts(), 10, "More posts should be loaded")
                    expectation.fulfill()
                }
                self.viewModel.loadPosts()
            }
        }
        
        viewModel.loadPosts()
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}


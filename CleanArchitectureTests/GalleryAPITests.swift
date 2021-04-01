//
//  NetworkCallTests.swift
//  CleanArchitectureTests
//
//  Created by Richa Srivastava on 27/03/21.
//  Copyright © 2021 harsivo. All rights reserved.
//

import Foundation
import XCTest
@testable import CleanArchitecture


class GalleryAPITests: XCTestCase  {
    func test_api_for_request() {
        let api = GallaryAPI()
        let params = ["client_id":Constants.APIKeys.kClientKey,"page" : 1, "query" : "dog"] as [String : Any];
        let request = api.makeRequest(from: params)
        
        XCTAssertNotNil(request)
        XCTAssertNotNil(request?.url)
        XCTAssertEqual(request?.url?.scheme, "https")
        XCTAssertEqual(request?.url?.host, "api.unsplash.com")
    }
    
    func test_api_for_parsing_logic() {
        let api = GallaryAPI()
        let data = ["total" : 1000, "total_pages": 1000, "result": nil]
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(data),
           let url = URL(string: Path().gallary),
           let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: "", headerFields: nil) {
            
            let response = try? api.parseResponse(data: jsonData, response: response)
            XCTAssertEqual(response?.total, 1000)
        }
        
    }
}

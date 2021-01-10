//
//  APILoader.swift
//  CleanArchitecture
//
//  Created by richa on 15/12/20.
//  Copyright © 2020 harsivo. All rights reserved.
//

import Foundation

class APILoader<T: APIHandler> {
    let apiRequest: T
    let urlSession: URLSession
    
    init(apiRequest: T, urlSession: URLSession = .shared) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
    }
    
    func loadAPIRequest(requestData: T.RequestDataType, completionHandler: @escaping (T.ResponseDataType?, Error?) -> ()) {
        if let urlRequest = apiRequest.makeRequest(from: requestData) {
            urlSession.dataTask(with: urlRequest) { (data, response, error) in
                guard let data = data, let httpResponse = response as? HTTPURLResponse else {
                    return completionHandler(nil, error)
                }
                do {
                    let parsedResponse = try self.apiRequest.parseResponse(data: data,response: httpResponse)
                    return completionHandler(parsedResponse, nil)
                } catch {
                    return completionHandler(nil, error)
                }
            }.resume()
        }
    }
}

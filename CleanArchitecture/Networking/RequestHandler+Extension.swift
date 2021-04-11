//
//  RequestHandler+Extension.swift
//  CleanArchitecture
//
//  Created by richa on 16/12/20.
//  Copyright © 2020 harsivo. All rights reserved.
//

import Foundation
// MARK: Request Handler Supporting methods

extension RequestHandler {
    
    func setQueryParams(parameters:[String: Any], url: URL) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters.map { element in URLQueryItem(name: element.key, value: String(describing: element.value) ) }
        return components?.url ?? url
    }
    
    func setDefaultHeaders(request: inout URLRequest) {
        request.setValue(Constants.APIHeaders.contentTypeValue, forHTTPHeaderField: Constants.APIHeaders.kContentType)
    }
}





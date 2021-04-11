//
//  APIEnvironment.swift
//  CleanArchitecture
//
//  Created by richa on 15/12/20.
//  Copyright © 2020 harsivo. All rights reserved.
//
//"https://api.unsplash.com/search/photos?client_id=JYRARXHZnEcTwGYa1sTS8mpR7WebBsH4Yn9Knsc-eAo&page=1&query=dog"
import Foundation
enum APIEnvironment {
    case development
    case staging
    case production
    
    func baseURL () -> String {
        return "https://\(subdomain()).\(domain())"
    }
    
    func domain() -> String {
        switch self {
        case .development:
            return "unsplash.com"
        case .staging:
            return "unsplash.com"
        case .production:
            return "unsplash.com"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development, .production, .staging:
            return "api"
        }
    }
    
    func route() -> String {
        return "/api/v1"
    }
}

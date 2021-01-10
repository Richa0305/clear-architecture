//
//  APIPath.swift
//  CleanArchitecture
//
//  Created by richa on 15/12/20.
//  Copyright © 2020 harsivo. All rights reserved.
//

import Foundation


#if DEBUG
let environment = Environment.development
#else
let environment = Environment.production
#endif

let baseURL = environment.baseURL()

struct Path {
    var gallary: String { return "\(baseURL)/search/photos"}
    
    
    
    
}



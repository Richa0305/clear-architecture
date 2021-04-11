//
//  APIPath.swift
//  CleanArchitecture
//
//  Created by richa on 15/12/20.
//  Copyright © 2020 harsivo. All rights reserved.
//

import Foundation


#if DEBUG
let environment = APIEnvironment.development
#else
let environment = APIEnvironment.production
#endif

let baseURL = environment.baseURL()

struct APIPath {
    var gallary: String { return "\(baseURL)/search/photos"}

}



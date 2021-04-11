//
//  GalleryViewModel.swift
//  CleanArchitecture
//
//  Created by richa on 15/12/20.
//  Copyright © 2020 harsivo. All rights reserved.
//

import Foundation

class GalleryViewModel {
    func getAPIData(param: [String: Any], completion: @escaping (GalleryModel?, ServiceError?) -> ()) {
        let request = GalleryAPI()
        
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(requestData: param) { (model, error) in
            if let _ = error {
                completion(nil, error)
            } else {
                completion(model, nil)
            }
        }
    }
}


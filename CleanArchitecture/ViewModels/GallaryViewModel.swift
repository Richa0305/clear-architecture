//
//  GallaryViewModel.swift
//  CleanArchitecture
//
//  Created by richa on 15/12/20.
//  Copyright © 2020 harsivo. All rights reserved.
//

import Foundation

class GallaryViewModel {
    func getAPIData(param: [String: Any], completion: @escaping (GalleryModel?, Error?) -> ()) {
        let request = GallaryAPI()
        
        let apiLoader = APILoader(apiRequest: request)
        apiLoader.loadAPIRequest(requestData: param) { (model, error) in
            if let _ = error {
                completion(nil, error)
            } else {
                completion(model, nil)
            }
        }
    }
}

//
//  Observable.swift
//  CleanArchitecture
//
//  Created by richa on 15/12/20.
//  Copyright © 2020 harsivo. All rights reserved.
//

import Foundation

class Observable<T> {
    var value: T {
        didSet {
           listener?(value)
        }
    }
    
    private var listener : ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    func bind(_ clouser: @escaping (T) -> Void) {
        clouser(value)
        listener = clouser
    }
    
}

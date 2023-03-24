//
//  Observable.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 24.03.2023.
//

import Foundation

final class Observable<T> {
    
    typealias Listener = (T) -> Void
    
    private var listener: Listener?
    
    private(set) var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(listener: Listener?, andFire: Bool = false) {
        self.listener = listener
        
        if andFire {
            listener?(value)
        }
    }
    
    func update(with value: T) {
        self.value = value
    }
}

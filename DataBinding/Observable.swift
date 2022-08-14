//
//  Observable.swift
//  DataBinding
//
//  Created by Вячеслав Квашнин on 15.08.2022.
//

import Foundation

class Observable<T> {
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        listener = closure
        listener?(value)
    }
}

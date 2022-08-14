//
//  CatViewModel.swift
//  DataBinding
//
//  Created by Вячеслав Квашнин on 14.08.2022.
//

import Foundation

class CatViewModel {
    
    var didChangeData: ((CatViewModel) -> Void)?
    
    var name: String {
        didSet {
            didChangeData?(self)
        }
    }
    
    var age: Observable<Int> = Observable(value: 0)
    
    init(cat: Cat) {
        self.name = cat.name
        self.age.value = 0
    }
    
    func showData() {
        self.name = "Simba"
        self.age.value = 5
    }
}

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
    
    init(cat: Cat) {
        self.name = cat.name
    }
    
    func showData() {
        self.name = "Simba"
    }
}

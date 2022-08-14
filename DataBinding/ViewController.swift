//
//  ViewController.swift
//  DataBinding
//
//  Created by Вячеслав Квашнин on 14.08.2022.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    
    var viewModel: CatViewModel!
    var cancellabel: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        setBindings()
    }
    
    func setBindings() {
        viewModel.didChangeData = { [unowned self] viewModel in
            self.oneLabel.text = viewModel.name
        }
        
        viewModel.age.bind { age in
            self.twoLabel.text = String(age)
        }
        
        viewModel.$color
            .compactMap { String($0) }
            .assign(to: \.text, on: threeLabel)
            .store(in: &cancellabel)
    }
    
    @IBAction func pressedButton(_ sender: Any) {
        viewModel.showData()
    }
}

extension ViewController {
    static func instantiate(storyboardName: String = "Main") -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateInitialViewController() as! Self
    }
}

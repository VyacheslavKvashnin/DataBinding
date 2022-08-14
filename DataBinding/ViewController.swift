//
//  ViewController.swift
//  DataBinding
//
//  Created by Вячеслав Квашнин on 14.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    
    var viewModel: CatViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        setBindings()
    }
    
    func setBindings() {
        viewModel.didChangeData = { [ unowned self] viewModel in
            self.oneLabel.text = viewModel.name
        }
    }
    
    @IBAction func pressedButton(_ sender: Any) {
        
    }
}

extension ViewController {
    static func instantiate(storyboardName: String = "Main") -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateInitialViewController() as! Self
    }
}

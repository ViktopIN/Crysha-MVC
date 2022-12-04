//
//  ViewController.swift
//  Crysha-MVC
//
//  Created by Виктор on 21.11.2022.
//

import UIKit

class CustomBaseViewController: UIViewController {
    
    // MARK: - Properties
    
    var navigationBarColor: UIColor {
        return .systemBackground
    }
    
    // MARK: - overrided Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.backgroundColor = navigationBarColor
    }
}

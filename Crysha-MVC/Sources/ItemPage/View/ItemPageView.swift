//
//  ItemPageView.swift
//  Crysha-MVC
//
//  Created by Виктор on 30.10.2022.
//

import UIKit

class ItemPageView: UIView {
    // MARK: - Views
    
    // MARK: - Initialiser
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        setupLayout()
        setupHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        
    }
    
    private func setupView() {
        backgroundColor = .white
    }
}

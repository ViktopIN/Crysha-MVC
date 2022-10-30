//
//  ItemPageViewController.swift
//  Crysha-MVC
//
//  Created by Виктор on 30.10.2022.
//

import UIKit

class ItemPageViewController: UIViewController {
    
    // MARK: - Properties
    
    var mainPageViewController: UIViewController = MainPageViewController()
    var viewItem: ItemPageView!
    
    // MARK: - View
    
    private var itemPageView: ItemPageView? {
        guard isViewLoaded else { return nil }
        return (view as? ItemPageView)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        
    }
    
    private func setupView() {
        view = viewItem
        navigationController?.navigationBar.isHidden = true
        navigationItem.setHidesBackButton(true, animated: false)
        tabBarController?.tabBar.isHidden = true
    }
}

// MARK: - Extensions

extension ItemPageViewController: ItemPageViewControllerProtocol {
    
    func goBack() {
        navigationController?.popToViewController(mainPageViewController, animated: true)
    }
}


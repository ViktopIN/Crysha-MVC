//
//  ItemPageViewController.swift
//  Crysha-MVC
//
//  Created by Виктор on 30.10.2022.
//

import UIKit

class ItemPageViewController: UIViewController {
    
    // MARK: - Properties
    
    enum Supplementary {
        static let logo = "logoReusableView"
        static let counter = "imageCounterReusableView"
        static let panel = "sharedAndFavoritesPanelReusableView"
    }
    var mainPageViewController: UIViewController = MainPageViewController()
    private var mainScrollView: UIScrollView!
    var viewItem: ItemPageView!
    private var dataSource = MainModel.getModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        navigationController?.setNavigationBarHidden(true, animated: true)
        tabBarController?.tabBar.isHidden = true
    }
        
    // MARK: - Settings
    
    private func setupView() {
        view = viewItem
        DispatchQueue.main.async {
            self.viewItem.configureView(model: self.dataSource[0])
        }
        
        mainScrollView = viewItem.configureScrollViewDelegate()
        mainScrollView.delegate = self
    }
}

// MARK: - Extensions

extension ItemPageViewController: ItemPageViewControllerProtocol {
    
    @objc func goBack() {
        navigationController?.popToViewController(mainPageViewController, animated: true)
    }
}

extension ItemPageViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let navigationBarAppearScratch = UIScreen.main.bounds.width
        if offset > navigationBarAppearScratch {
            UIView.animate(withDuration: 0.1) {
                self.viewItem.configureAppearingOfAppearingView(opacityValue: (offset - navigationBarAppearScratch) / 50 )
            }
        } else {
            UIView.animate(withDuration: 0.1) {
            }
        }
    }
}

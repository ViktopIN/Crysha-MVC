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
    weak var mainPageViewController: UIViewController!
    private var mainScrollView: UIScrollView!
    var viewItem: ItemPageView! = ItemPageView(frame: .zero)
    var dataSource: MainModel!
    
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
        viewItem.controller = self
        view = viewItem
        DispatchQueue.main.async {
            self.viewItem.configureView(model: self.dataSource)
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
        let offset = (scrollView.contentOffset.y / 10).rounded()
        let navigationBarAppearScratch = (UIScreen.main.bounds.width / 10).rounded()
        if offset > navigationBarAppearScratch {
            UIView.animate(withDuration: 1) {
                self.viewItem.customNavigationBarIsHidden(false)
            }
        } else {
            UIView.animate(withDuration: 1) {
                self.viewItem.customNavigationBarIsHidden(true)
            }

        }
    }
}


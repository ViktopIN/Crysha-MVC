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
        //navigationItem.hidesBackButton = true
        navigationController?.setNavigationBarHidden(true, animated: true)
        tabBarController?.tabBar.isHidden = true
    }
        
    // MARK: - Settings
    
    private func setupView() {
        view = viewItem
        DispatchQueue.main.async {
            self.viewItem.configureView(model: self.dataSource[0])
        }
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .white
        
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
                let navigationColor = UIColor.white.withAlphaComponent((offset - navigationBarAppearScratch) / 50)
//                if let navigationController = self.navigationController as? CryshasMainNavigationController {
//                    if navigationController.navigationBar.isHidden {
//                        DispatchQueue.once(token: 1) {
//                            navigationController.addItemPageViewsToNavBar(titleText: self.dataSource[0].shortDescription) {
//                                self.goBack()
//                            }
//                        }
//                    }
//                }
                self.navigationController?.setNavigationBarHidden(false, animated: true)
                if #available(iOS 13.0, *) {
                    let navBarAppearance = UINavigationBarAppearance()
                    navBarAppearance.configureWithOpaqueBackground()
                    navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                    navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                    navBarAppearance.backgroundColor = navigationColor
                    self.navigationController?.navigationBar.standardAppearance = navBarAppearance
                    self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

                }
                
            }
        } else {
            UIView.animate(withDuration: 0.1) {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
            }
        }
    }
}

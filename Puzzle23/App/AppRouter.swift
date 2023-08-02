//
//  AppRouter.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import UIKit

protocol Router {
    var currentViewController: UIViewController? { get }

    @discardableResult
   
    func route(to: Destination, animated: Bool) -> UIViewController?
  
    func routePresent(to: Destination, animated: Bool) -> UIViewController?

    func showError(title: String, message: String)

    func showInfo(vc: UIViewController, popoverVC: UIViewController)
    
}


class AppRouter: Router {
 
    public var currentViewController: UIViewController? {
        return navigationController.topViewController
    }

    private let navigationController: UINavigationController

    init(window: UIWindow) {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = true
        window.makeKeyAndVisible()
        
    }

    @discardableResult

    public func route(to destination: Destination, animated: Bool = true) -> UIViewController? {
        guard let newViewController = destination.destination else { return nil }
        show(viewController: newViewController, animated: animated)
        return newViewController
    }
    public func routePresent(to destination: Destination, animated: Bool = true) -> UIViewController? {
        guard let newViewController = destination.destination else { return nil }
        presentOnly(viewController: newViewController, animated: animated)
        return newViewController
    }

    public func showError(title: String, message text: String) {
        let alertController = UIAlertController(title: title, message: text, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction) -> Void in
            alertController.dismiss(animated: true)
        }
        alertController.addAction(cancel)
        currentViewController?.present(alertController, animated: true)
    }

    public func showInfo(vc: UIViewController, popoverVC: UIViewController) {
        popoverVC.modalPresentationStyle = .popover
        popoverVC.modalTransitionStyle = .flipHorizontal
        vc.present(popoverVC, animated: true)
    }

    private func show(viewController contr: UIViewController, animated: Bool = true) {
        guard currentViewController != contr else { return }
        self.navigationController.pushViewController(contr, animated: animated)
        self.navigationController.setViewControllers([contr], animated: animated)
    }

    private func presentOnly(viewController contr: UIViewController, animated: Bool = true) {
        guard currentViewController != contr else { return }
        self.navigationController.pushViewController(contr, animated: animated)
    }
   
}


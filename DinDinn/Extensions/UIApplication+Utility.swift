//
//  UIApplication+Utility.swift
//  DinDinn
//
//  Created by erfan on 9/29/1399 AP.
//

import UIKit

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController, completion: ((UIViewController?)->Void)?) {
        var viewController: UIViewController?
        
        if let navigationController = controller as? UINavigationController {
            viewController = topViewController(controller: navigationController.visibleViewController)
        } else if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                viewController = topViewController(controller: selected)
            }
        } else if let presented = controller?.presentedViewController {
            viewController = topViewController(controller: presented)
        }
        
        if viewController == nil {
            viewController = controller
        }
        
        DispatchQueue.main.async {
            completion?(viewController)
        }
    }
    class func showOnTopViewController(_ controller: UIViewController, animated: Bool = true) {
        UIApplication.topViewController { topController in
            if let navigationController: UINavigationController = topController?.navigationController {
                navigationController.isNavigationBarHidden = true
                navigationController.isToolbarHidden = true
                navigationController.pushViewController(controller, animated: animated)
            } else {
                controller.modalPresentationStyle = .fullScreen
                topController?.present(controller, animated: animated, completion: nil)
            }
        }
    }
}

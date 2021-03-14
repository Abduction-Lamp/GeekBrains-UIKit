//
//  CustomNavigationController.swift
//  VK-UIKit
//
//  Created by Владимир on 12.03.2021.
//

import UIKit

class CustomNavigationController: UINavigationController {

    let interactiveTransition = CustomInteractiveTransition()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension CustomNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return interactiveTransition.hasStarted ? interactiveTransition : nil
    }
    
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        var animatedTransitioning: UIViewControllerAnimatedTransitioning? = nil
        switch operation {
        case .push:
            self.interactiveTransition.viewController = toVC
            animatedTransitioning = CustomPushAnimator()
            
        case .pop:
            if navigationController.viewControllers.first != toVC {
                self.interactiveTransition.viewController = toVC
            }
            animatedTransitioning = CustomPopAnimator()
            
        default:
            break
        }
        
        return animatedTransitioning
    }
}

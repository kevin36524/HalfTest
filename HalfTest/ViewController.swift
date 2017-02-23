//
//  ViewController.swift
//  HalfTest
//
//  Created by Kevin Balvantkumar Patel on 2/22/17.
//  Copyright © 2017 LZChat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.custom
        destinationVC.transitioningDelegate = self
    }

}

extension ViewController : UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfPresentationController(presentedViewController: presented, presenting: presenting)
    }
}


class SecondViewController: UIViewController {
    
    @IBAction func dissmissChild(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

class  HalfPresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        if let containerViewBounds = containerView?.bounds {
            return CGRect(x: 0, y: containerViewBounds.height/2, width: containerViewBounds.width, height: containerViewBounds.height/2)
        }
        return CGRect.zero
    }
}

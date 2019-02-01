//
//  ViewController.swift
//  Tower
//
//  Created by Laura Arranz on 01/02/2019.
//  Copyright © 2019 Laura Arranz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animator : UIDynamicAnimator!
    var gravity : UIGravityBehavior!
    var collision : UICollisionBehavior!
    var ball : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ball = UIImageView(image: UIImage(named: "ball.jpg"))
        ball.frame = CGRect(x: self.view.frame.size.width / 2 - 50 , y: 20, width: 100.0, height: 100.0)
        view.addSubview(ball)
        
        gravity = UIGravityBehavior()
        gravity.addItem(ball)
        
        collision = UICollisionBehavior()
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.addItem(ball)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
    }
    
    
}


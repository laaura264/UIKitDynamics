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
   /* var gravity : UIGravityBehavior!
    var collision : UICollisionBehavior!*/
    var snap : UISnapBehavior!
    var ball : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ball = UIImageView(image: UIImage(named: "ball.jpg"))
        ball.frame = CGRect(x: self.view.frame.size.width / 2 - 50 , y: 20, width: 100.0, height: 100.0)
        view.addSubview(ball)
        
       /* gravity = UIGravityBehavior()
        gravity.addItem(ball)
        
        collision = UICollisionBehavior()
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.addItem(ball)*/
        
        animator = UIDynamicAnimator(referenceView: self.view)
        /*animator.addBehavior(gravity)
        animator.addBehavior(collision)*/
        
        let itemBehavior = UIDynamicItemBehavior(items: [ball])
        itemBehavior.elasticity = 0.9
        animator.addBehavior(itemBehavior)
    }
    
    //Animación tocando la pantalla
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let point = touches.first?.location(in: self.view){
            if snap != nil{
                animator.removeBehavior(snap)
            }
            snap = UISnapBehavior (item:ball, snapTo:point)
            animator.addBehavior(snap)
        }
    }
    
}


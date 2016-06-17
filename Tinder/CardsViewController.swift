//
//  CardsViewController.swift
//  Tinder
//
//  Created by Omar Siddiqui on 6/16/16.
//  Copyright © 2016 Omar Siddiqui. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var cardInitialCenter: CGPoint!
    var resetPoint: CGPoint!
    var resetWidth: CGFloat!
    var resetHeight: CGFloat!

    @IBOutlet weak var ryanView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        resetPoint = ryanView.frame.origin
        resetWidth = ryanView.frame.width
        resetHeight = ryanView.frame.height
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didDragCard(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        let point = sender.locationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            cardInitialCenter = ryanView.center
            

            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            if point.y <= ryanView.frame.height / 2 {
            
            ryanView.transform = CGAffineTransformMakeRotation(translation.x * 45 / 160 * CGFloat(M_PI) / 180)
            
            ryanView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
                
                
                
            } else if point.y > ryanView.frame.height / 2 {
            
                ryanView.transform = CGAffineTransformMakeRotation(-translation.x * 45 / 160 * CGFloat(M_PI) / 180)
                
                ryanView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
                
                
            }
            
            
            print("X \(ryanView.center.x)")
            print("Y \ryanView.center.y)")
            
            print("Translation \(translation.x)")
            
            
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            if translation.x > 50 {
                UIView.animateWithDuration(0.5) {
                    self.ryanView.frame.origin.x = self.view.frame.width * 2
                    
                }
            } else if translation.x < -50 {
                UIView.animateWithDuration(0.5) {
                    self.ryanView.frame.origin.x = -self.view.frame.width * 2
                    
                }
            } else {
            
                UIView.animateWithDuration(0.5) {
                self.ryanView.transform = CGAffineTransformIdentity
                }
            
            }

        }
        
    }

    
    @IBAction func didTapReset(sender: UIButton) {
        ryanView.frame.origin.x = resetPoint.x 
        ryanView.frame.origin.y = resetPoint.y
//        ryanView.frame.width = resetWidth
//        ryanView.frame.height = resetHeight
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

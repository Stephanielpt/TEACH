//
//  DrawViewController2.swift
//  Teach
//
//  Created by Stephanie Lampotang on 2/18/18.
//  Copyright © 2018 Stephanie Lampotang. All rights reserved.
//

import UIKit
//import Cocoa

class DrawViewController2: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var lastPoint:CGPoint!
    var isSwiping:Bool!
    var red:CGFloat!
    var green:CGFloat!
    var blue:CGFloat!
    var brush:CGFloat!
    var opacity:CGFloat!
    
    // Do any additional setup after loading the view.
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        
        red = 0.0/255.0;
        green = 0.0/255.0;
        blue = 0.0/255.0;
        brush = 10.0;
        opacity = 1.0;
        imageView.isUserInteractionEnabled = true
        
        imageView.isMultipleTouchEnabled = true
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func toNextDraw(_ sender: Any) {
        self.performSegue(withIdentifier: "draw3", sender: nil)
    }
    
//    @IBAction func toNextDraw(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "draw3", sender: nil)
//    }
    
    // MARK: Touch Handling
    
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        // 1
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        // 2
        //        let path = CGMutablePath()
        //        path.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        //        path.move(to: CGPoint(x: toPoint.x, y: toPoint.y))
        //
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        // 3
        context!.setLineCap(.round)
        context!.setLineWidth(3)
        
        context!.setBlendMode(.darken)
        
        // 4
        context!.strokePath()
        
        // 5
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        imageView.alpha = opacity
        UIGraphicsEndImageContext()
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isSwiping = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            
            // 7
            lastPoint = currentPoint
        }
    }
    
    let colors: [(CGFloat, CGFloat, CGFloat)] = [
        (0, 0, 0),
        (105.0 / 255.0, 105.0 / 255.0, 105.0 / 255.0),
        (1.0, 0, 0),
        (0, 0, 1.0),
        (51.0 / 255.0, 204.0 / 255.0, 1.0),
        (102.0 / 255.0, 204.0 / 255.0, 0),
        (102.0 / 255.0, 1.0, 0),
        (160.0 / 255.0, 82.0 / 255.0, 45.0 / 255.0),
        (1.0, 102.0 / 255.0, 0),
        (1.0, 1.0, 0),
        (1.0, 1.0, 1.0),
        ]
    
    @IBAction func redMarker(_ sender: Any) {
        print("REEEDDDDDDDDDD")
        (red!, green!, blue!) = (255, 0, 0)
    }
    @IBAction func pencilPressed(_ sender: Any) {
        print("pencil pressed")
        var index = (sender as AnyObject).tag ?? 0
        if index < 0 || index >= colors.count {
            index = 0
        }
        
        // 2
        (red!, green!, blue!) = colors[index]
        print(red)
        print(green)
        print(blue)
        // 3
        if index == colors.count - 1 {
            opacity = 1.0
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


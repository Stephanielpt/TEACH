//
//  DrawViewController1.swift
//  Teach
//
//  Created by Stephanie Lampotang on 2/18/18.
//  Copyright © 2018 Stephanie Lampotang. All rights reserved.
//

import UIKit
//import Cocoa

class DrawViewController1: UIViewController {
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet var imageView: UIImageView!
    var lastPoint:CGPoint!
    var isSwiping:Bool!
    var red:CGFloat!
    var green:CGFloat!
    var blue:CGFloat!
    var brush:CGFloat!
    var opacity:CGFloat!
    
    // Do any additional setup after loading the view.
    
    @IBAction func backPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func toNextDraw(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "draw2", sender: nil)
    }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        
        red = 0.0/255.0;
        green = 0.0/255.0;
        blue = 0.0/255.0;
        brush = 10.0;
        opacity = 1.0;
        imageView.isUserInteractionEnabled = true
        
        imageView.isMultipleTouchEnabled = true
        
        let bluminesence = UIColor(displayP3Red: 19/255, green: 194/255, blue: 204/255, alpha: 1)
        navBar.backgroundColor = bluminesence
    }
    
    
    // MARK: Touch Handling
    var i = 0
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
        if i == 0 {
            context!.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
            context!.setLineWidth(3)
        }
        if i == 1 {
            context!.setStrokeColor(red: 105.0 / 255.0, green: 105.0 / 255.0, blue: 105.0 / 255.0, alpha: 1)
            context!.setLineWidth(3)
        }
        if i == 2 {
            context!.setStrokeColor(red: 1, green: 0, blue: 0, alpha: 1)
            context!.setLineWidth(3)
        }
        if i == 3 {
            context!.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
            context!.setLineWidth(3)
        }
        if i == 4 {
            context!.setStrokeColor(red: 34.0 / 255.0, green: 139.0 / 255.0, blue: 34.0 / 255.0, alpha: 1)
            context!.setLineWidth(3)
        }
        if i == 5 {
            context!.setStrokeColor(red: 0, green: 1, blue: 0, alpha: 1)
            context!.setLineWidth(3)
        }
        if i == 6 {
            context!.setStrokeColor(red: 160/255, green: 1, blue: 1, alpha: 1)
            context!.setLineWidth(3)
        }
        if i == 7 {
            context!.setStrokeColor(red: 165/255, green: 82/255, blue: 45/255, alpha: 1)
            context!.setLineWidth(3)
        }
        if i == 8 {
            context!.setStrokeColor(red: 255/255, green: 165/255, blue: 0, alpha: 1)
            context!.setLineWidth(3)
        }
        if i == 9 {
            context!.setStrokeColor(red: 1, green: 1, blue: 0, alpha: 1)
            context!.setLineWidth(3)
        }
        if i == 10 {
            context!.setStrokeColor(red: 1, green: 1, blue: 1, alpha: 1)
            context!.setLineWidth(6)
        }
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
    @IBAction func blackMarker(_ sender: Any) {
        i = 0
    }
    @IBAction func greyMarker(_ sender: Any) {
        i = 1
    }
    @IBAction func redMarker(_ sender: Any) {
        print("REEEDDDDDDDDDD")
        i = 2
    }
    @IBAction func blueMarker(_ sender: Any) {
        i = 3
    }
    @IBAction func darkgreenMarker(_ sender: Any) {
        i = 4
    }
    @IBAction func lightgreenMarker(_ sender: Any) {
        i = 5
    }
    @IBAction func lightblueMarker(_ sender: Any) {
        i = 6
    }
    @IBAction func brownMarker(_ sender: Any) {
        i = 7
    }
    @IBAction func orangeMarker(_ sender: Any) {
        i = 8
    }
    @IBAction func yellowMarker(_ sender: Any) {
        i = 9
    }
    @IBAction func erase(_ sender: Any) {
        i = 10
    }
//    @IBAction func redMarker(_ sender: Any) {
//        print("REEEDDDDDDDDDD")
//        (red!, green!, blue!) = (255, 0, 0)
//    }
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


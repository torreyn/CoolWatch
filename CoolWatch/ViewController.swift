//
//  ViewController.swift
//  CoolWatch
//
//  Created by TORREY NOMMESEN
//         and BEN MORROW
//          on 9/27/14
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    var innerCircle = CAShapeLayer()
    var midCircle = CAShapeLayer()
    var outerCircle = CAShapeLayer()
    
    // var timeCheck = 0
    
    var simulatedDate = NSDate()
    
    @IBOutlet weak var drawingView: UIView!
    
    @IBOutlet weak var minutesLabel: UILabel!
    
    @IBAction func buttonTapped() { // on Button Tap
        // add 1 hour and 11 minutes
        simulatedDate = simulatedDate.dateByAddingTimeInterval(4260)
        drawCircles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tic()
        NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: Selector("tic"), userInfo: nil, repeats: true)
    }
    
    func tic(){ // get current date and call drawCircles
        simulatedDate = NSDate()
        drawCircles()
    }
    
    func drawCircles(){

        // clear drawingView sub layers
        if let sublayers = drawingView.layer.sublayers {
            sublayers.map { $0.removeFromSuperlayer() }
        }
        
        // separate time into minutes
        // change the texts of minutesLabel to the current minutes
        // separate time into hours
        // set hours to the current hour
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "m"
        minutesLabel.text = dateFormatter.stringFromDate(simulatedDate)
        dateFormatter.dateFormat = "h"
        var hours = dateFormatter.stringFromDate(simulatedDate)
        
        
        var innerChunk:CGFloat = 0
        var midChunk:CGFloat = 0
        var outerChunk:CGFloat = 0
        
        switch hours {
        case "1" :
            innerChunk = 0.25
            midChunk = 0
            outerChunk = 0
        case "2" :
            innerChunk = 0.50
            midChunk = 0
            outerChunk = 0
        case "3" :
            innerChunk = 0.75
            midChunk = 0
            outerChunk = 0
        case "4" :
            innerChunk = 1
            midChunk = 0
            outerChunk = 0
        case "5" :
            midChunk = 0.25
            innerChunk = 1
            outerChunk = 0
        case "6" :
            midChunk = 0.50
            innerChunk = 1
            outerChunk = 0
        case "7" :
            midChunk = 0.75
            innerChunk = 1
            outerChunk = 0
        case "8" :
            midChunk = 1
            innerChunk = 1
            outerChunk = 0
        case "9" :
            outerChunk = 0.25
            innerChunk = 1
            midChunk = 1
        case "10" :
            outerChunk = 0.50
            innerChunk = 1
            midChunk = 1
        case "11" :
            outerChunk = 0.75
            innerChunk = 1
            midChunk = 1
        case "12" :
            outerChunk = 1
            innerChunk = 1
            midChunk = 1
        default : break
        }

        
//        for sublayer in drawingView.layer.sublayers {
//            sublayer.removeFromSuperlayer()
//        }
        //println(drawingView.layer.sublayers)
        
        let centerPoint = CGPoint (x: drawingView.bounds.width / 2, y: drawingView.bounds.height / 2)
        
        // inner circle
        
        let innerCircleRadius : CGFloat = drawingView.bounds.width / 2 * 0.35
        
        var innerCirclePath = UIBezierPath(arcCenter: centerPoint, radius: innerCircleRadius, startAngle: CGFloat(-0.5 * M_PI), endAngle: CGFloat(1.5 * M_PI), clockwise: true    )
        
        innerCircle = CAShapeLayer()
        innerCircle.path = innerCirclePath.CGPath
        innerCircle.strokeColor = UIColor.cyanColor().CGColor
        innerCircle.fillColor = UIColor.clearColor().CGColor
        innerCircle.lineWidth = 15
        innerCircle.strokeStart = 0
        innerCircle.strokeEnd = 0.22
        
        drawingView.layer.addSublayer(innerCircle)
        
        
        // middle circle
        let midCircleRadius : CGFloat = drawingView.bounds.width / 2 * 0.59
        
        var midPath = UIBezierPath(arcCenter: centerPoint, radius: midCircleRadius, startAngle: CGFloat(-0.5 * M_PI), endAngle: CGFloat(1.5 * M_PI), clockwise: true    )
        
        midCircle = CAShapeLayer()
        midCircle.path = midPath.CGPath
        midCircle.strokeColor = UIColor.greenColor().CGColor
        midCircle.fillColor = UIColor.clearColor().CGColor
        midCircle.lineWidth = 15
        midCircle.strokeStart = 0
        midCircle.strokeEnd = 0.22
        
        drawingView.layer.addSublayer(midCircle)
        
        
        // outer circle
        let outerCircleRadius : CGFloat = drawingView.bounds.width / 2 * 0.83
        
        var outerCirclePath = UIBezierPath(arcCenter: centerPoint, radius: outerCircleRadius, startAngle: CGFloat(-0.5 * M_PI), endAngle: CGFloat(1.5 * M_PI), clockwise: true    )
        
        outerCircle = CAShapeLayer()
        outerCircle.path = outerCirclePath.CGPath
        outerCircle.strokeColor = UIColor.redColor().CGColor
        outerCircle.fillColor = UIColor.clearColor().CGColor
        outerCircle.lineWidth = 15
        outerCircle.strokeStart = 0
        outerCircle.strokeEnd = 0.22
        
        drawingView.layer.addSublayer(outerCircle)
        
        innerCircle.strokeEnd = innerChunk
        midCircle.strokeEnd = midChunk
        outerCircle.strokeEnd = outerChunk

        // removed becuase it over-wrote the button
//        self.view.addSubview(drawingView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



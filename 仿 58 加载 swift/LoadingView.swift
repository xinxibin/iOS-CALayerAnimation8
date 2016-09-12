
//  Created by Xinxibin on 16/7/13.
//  Copyright © 2016年 GloryMan. All rights reserved.

/*
 
    实现原理:
 
    五条线条
        1.橙色线条
        2.红色线条
        3.4 都是白色线条 
        5. 红色半圆的那个线条
 
    1234 都是需要完成动画所必需的 
 
    5线条 执行结束 34 覆盖线条才会开始执行 
 
 
 */

import UIKit

class LoadingView: UIView {
    
    var shapeLayer:CAShapeLayer!
    var originShapeLayer:CAShapeLayer!
    var whiteShapeLayer:CAShapeLayer!
    
    var redShapeLayer:CAShapeLayer!
    var White2ShapeLayer:CAShapeLayer!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createArc()
        createOrgOneRound()
        createRedOneRound()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        createArc()
        createOrgOneRound()
        createRedOneRound()
    }
    
    /**
     创建一个半圆
     */
    func createArc() {
        
        let path = UIBezierPath(arcCenter: self.center, radius: 100, startAngle: 0, endAngle: CGFloat(3.7 * M_PI_4), clockwise: true)
        
        shapeLayer      = CAShapeLayer()
        shapeLayer.path     = path.CGPath
        shapeLayer.fillColor    = UIColor.clearColor().CGColor
        shapeLayer.strokeColor  = UIColor.redColor().CGColor
        shapeLayer.speed        = 0.5
        shapeLayer.lineWidth    = 1;
        shapeLayer.lineCap      = kCALineCapButt
        
        self.layer.addSublayer(shapeLayer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.25
        animation.fromValue = 0
        animation.delegate = self
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.setValue("CABasicAnimationStrokeEnd", forKey: "animationName")
        shapeLayer.addAnimation(animation, forKey: "CABasicAnimationStrokeEnd")
    }
    
    /**
     创建橙色圆
     */
    func createOrgOneRound() {
        
        let path1 = UIBezierPath(ovalInRect: self.bounds)
        originShapeLayer                = CAShapeLayer()
        originShapeLayer.frame          = self.bounds
        originShapeLayer.fillColor      = UIColor.clearColor().CGColor
        originShapeLayer.strokeColor    = UIColor.orangeColor().CGColor
        originShapeLayer.speed          = 0.5
        originShapeLayer.path           = path1.CGPath;
        originShapeLayer.lineWidth      = 3
        originShapeLayer.lineCap        = kCALineCapButt
        self.layer.addSublayer(originShapeLayer)
    
        originShapeLayer.strokeStart    = 0
        originShapeLayer.strokeEnd      = 1
        
        let animation1 = CABasicAnimation(keyPath: "strokeEnd");
        animation1.duration = 0.6
        animation1.fromValue = 0
        animation1.delegate = self
        animation1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation1.setValue("CABasicAnimationStrokeEndOne", forKey: "animationName")
        originShapeLayer.addAnimation(animation1, forKey: "CABasicAnimationStrokeEndOne")
        
    }
    
    /**
     创建橙色覆盖圆 白色的
     */
    func createOrgTwoRound() {
        let path2 = UIBezierPath(ovalInRect: self.bounds)
        whiteShapeLayer                = CAShapeLayer()
        whiteShapeLayer.frame          = self.bounds
        whiteShapeLayer.fillColor      = UIColor.clearColor().CGColor
        whiteShapeLayer.strokeColor    = UIColor.whiteColor().CGColor
        whiteShapeLayer.speed          = 0.5
        whiteShapeLayer.path           = path2.CGPath;
        whiteShapeLayer.lineWidth      = 4
        whiteShapeLayer.lineCap        = kCALineCapButt
        self.layer.addSublayer(whiteShapeLayer)
        
        whiteShapeLayer.strokeStart    = 0
        whiteShapeLayer.strokeEnd      = 1
        
        let animation2 = CABasicAnimation(keyPath: "strokeEnd");
        animation2.duration = 0.6
        animation2.fromValue = 0
        animation2.delegate = self
        animation2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation2.setValue("CABasicAnimationStrokeEndTwo", forKey: "animationName")
        whiteShapeLayer.addAnimation(animation2, forKey: "CABasicAnimationStrokeEndTwo")
        
    }
    
    /**
     创建红色圆
     */
    func createRedOneRound() {
        
        let path1 = UIBezierPath(ovalInRect: CGRectMake(50, 50, 100, 100))
        redShapeLayer                = CAShapeLayer()
        redShapeLayer.frame          = self.bounds
        redShapeLayer.fillColor      = UIColor.clearColor().CGColor
        redShapeLayer.strokeColor    = UIColor.redColor().CGColor
        redShapeLayer.speed          = 0.5
        redShapeLayer.path           = path1.CGPath;
        redShapeLayer.lineWidth      = 3
        redShapeLayer.lineCap        = kCALineCapButt
        redShapeLayer.transform     = CATransform3DRotate(redShapeLayer.transform, CGFloat(-M_PI), 0, 0, 1)
        self.layer.addSublayer(redShapeLayer)
        
        redShapeLayer.strokeStart    = 0
        redShapeLayer.strokeEnd      = 1

        let animation1 = CABasicAnimation(keyPath: "strokeEnd");
        animation1.duration = 0.6
        animation1.fromValue = 0
        animation1.delegate = self
        animation1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation1.setValue("CABasicAnimationStrokeEndOneRed", forKey: "animationName")
        redShapeLayer.addAnimation(animation1, forKey: "CABasicAnimationStrokeEndOneRed")
        
    }
    
    /**
     创建一个红色覆盖圆 白色的
     */
    func createRedTwoRound() {
        let path2 = UIBezierPath(ovalInRect: CGRectMake(50, 50, 100, 100))
        White2ShapeLayer                = CAShapeLayer()
        White2ShapeLayer.frame          = self.bounds
        White2ShapeLayer.fillColor      = UIColor.clearColor().CGColor
        White2ShapeLayer.strokeColor    = UIColor.whiteColor().CGColor
        White2ShapeLayer.speed          = 0.5
        White2ShapeLayer.path           = path2.CGPath;
        White2ShapeLayer.lineWidth      = 4
        White2ShapeLayer.lineCap        = kCALineCapButt
        White2ShapeLayer.transform     = CATransform3DRotate(White2ShapeLayer.transform, CGFloat(-M_PI), 0, 0, 1)
        self.layer.addSublayer(White2ShapeLayer)
        
        White2ShapeLayer.strokeStart    = 0
        White2ShapeLayer.strokeEnd      = 1
        
        let animation2 = CABasicAnimation(keyPath: "strokeEnd");
        animation2.duration = 0.6
        animation2.fromValue = 0
        animation2.delegate = self
        animation2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation2.setValue("CABasicAnimationStrokeEndTwoRed", forKey: "animationName")
        White2ShapeLayer.addAnimation(animation2, forKey: "CABasicAnimationStrokeEndTwoRed")
        
    }
    
}

extension LoadingView {
    
    /**
     动画执行开始  或者 结束的 回调方法 系统的
     */
    override func animationDidStart(anim: CAAnimation) {
        
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
        if anim.valueForKey("animationName") as? String == "CABasicAnimationStrokeEnd" {
            print("结束了")
            createOrgTwoRound()
            createRedTwoRound()

        } else if anim.valueForKey("animationName") as? String == "CABasicAnimationStrokeEndTwo" {
            shapeLayer.removeAllAnimations()
            shapeLayer.removeFromSuperlayer()
            
            originShapeLayer.removeAllAnimations()
            originShapeLayer.removeFromSuperlayer()
            whiteShapeLayer.removeAllAnimations()
            whiteShapeLayer.removeFromSuperlayer()
            
            redShapeLayer.removeAllAnimations()
            redShapeLayer.removeFromSuperlayer()
            White2ShapeLayer.removeAllAnimations()
            White2ShapeLayer.removeFromSuperlayer()
            
            createArc()
            createOrgOneRound()
            createRedOneRound()
        } else if anim.valueForKey("animationName") as? String == "CABasicAnimationStrokeEndTwo" {

        }
        
    }
    
}






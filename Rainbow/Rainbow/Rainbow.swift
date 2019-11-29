//
//  Rainbow.swift
//  Rainbow
//
//  Created by 최혜선 on 2019/11/29.
//  Copyright © 2019 ulike. All rights reserved.
//

import UIKit

@IBDesignable
class Rainbow: UIView {
    
    @IBInspectable var firstColor: UIColor = UIColor(red: (238/255.0), green: (238/255), blue: (238/255.0), alpha: 1.0)
    @IBInspectable var secondColor: UIColor = UIColor(red: (204/255.0), green: (204/255), blue: (204/255.0), alpha: 1.0)
    @IBInspectable var thirdColor: UIColor = UIColor(red: (153/255.0), green: (153/255), blue: (153/255.0), alpha: 1.0)
    @IBInspectable var fourthColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1.0)
    
    func addOval(lineWidth: CGFloat, path: CGPath, strokeStart: CGFloat, strokeEnd: CGFloat, strokeColor: UIColor,
                 fillColor: UIColor, shadowRadius: CGFloat, shadowOpacity: Float, shadowOffsset: CGSize, number: String) {
        let arc = CAShapeLayer()
        arc.name = "line \(number)"
        arc.lineWidth = lineWidth
        arc.path = path
        arc.strokeStart = strokeStart
        arc.strokeEnd = strokeEnd
        arc.strokeColor = strokeColor.cgColor
        arc.fillColor = fillColor.cgColor
        arc.shadowColor = UIColor.black.cgColor
        arc.shadowRadius = shadowRadius
        arc.shadowOpacity = shadowOpacity
        arc.shadowOffset = shadowOffsset
        layer.addSublayer(arc)
    }
    
    override func draw(_ rect: CGRect) {
        // Add ARCs
        self.addCirle(arcRadius: 112,  color: self.firstColor, number: "1")
        self.addCirle(arcRadius: 224, color: self.secondColor, number: "2")
        self.addCirle(arcRadius: 336, color: self.thirdColor, number: "3")
        self.addCirle(arcRadius: 448, color: self.fourthColor, number: "4")
    }
    
    func addCirle(arcRadius: CGFloat, color: UIColor, number: String) {
        let X = self.bounds.midX
        let Y = self.bounds.midY
     
        // Top Oval
        let pathTop = UIBezierPath(ovalIn: CGRect(x: (X - (arcRadius/2)), y: (Y - (arcRadius/2)),
                                                  width: arcRadius, height: arcRadius)).cgPath
        self.addOval(lineWidth: 56.0, path: pathTop, strokeStart: 0.5, strokeEnd: 1.0, strokeColor: color,
                     fillColor: .clear, shadowRadius: 0, shadowOpacity: 0, shadowOffsset: .zero, number: number)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        guard let point = touch?.location(in: self) else { return }
        guard let sublayers = self.layer.sublayers as? [CAShapeLayer] else { return }
        print("---------------")
        for layer in sublayers {
            if let path = layer.path, path.contains(point) {
                print(layer.name)
                break
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

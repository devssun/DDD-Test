//
//  PlusButton.swift
//  Rainbow
//
//  Created by 최혜선 on 2019/11/29.
//  Copyright © 2019 ulike. All rights reserved.
//

import UIKit

class PlusButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        let plusLineWidth: CGFloat = 2.5
        let plusButtonScale: CGFloat = 0.4
        let plusColor: UIColor = UIColor.white
        let halfWidth: CGFloat = bounds.width / 2
        let halfHeight: CGFloat = bounds.height / 2
        
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        //create the path
        let plusPath = UIBezierPath()
        
        //set the path's line width to the height of the stroke
        plusPath.lineWidth = plusLineWidth
        
        //move the initial point of the path
        //to the start of the horizontal stroke
        plusPath.move(to: CGPoint(
            x: halfWidth - halfPlusWidth,
            y: halfHeight))
        
        //add a point to the path at the end of the stroke
        plusPath.addLine(to: CGPoint(
            x: halfWidth + halfPlusWidth,
            y: halfHeight))
        
        // vertical stroke
        plusPath.move(to: CGPoint(
            x: halfWidth,
            y: halfHeight - halfPlusWidth))
        
        plusPath.addLine(to: CGPoint(
            x: halfWidth,
            y: halfHeight + halfPlusWidth))
        
        //set the stroke color
        plusColor.setStroke()
        
        //draw the stroke
        plusPath.stroke()
    }
}

//
//  MainTabBar.swift
//  Rainbow
//
//  Created by 최혜선 on 26/11/2019.
//  Copyright © 2019 ulike. All rights reserved.
//

import UIKit

let tabTabBarButtonNotification = Notification.Name(rawValue: "tabTabBarButtonNotification")

class MainTabBar: UITabBar {
    
    private var middleButton = PlusButton()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupMiddleButton()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.isHidden {
            return super.hitTest(point, with: event)
        }
        
        let from = point
        let to = middleButton.center
        
        return sqrt((from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)) <= 39 ? middleButton : super.hitTest(point, with: event)
    }
    
    private func setupMiddleButton() {
        middleButton.frame.size = CGSize(width: 56, height: 56)
        middleButton.backgroundColor = .systemBlue
        middleButton.layer.cornerRadius = 28
        middleButton.layer.masksToBounds = true
        middleButton.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
        middleButton.addTarget(self, action: #selector(touchedMiddleButton), for: .touchUpInside)
        addSubview(middleButton)
    }
    
    @objc private func touchedMiddleButton() {
        NotificationCenter.default.post(name: tabTabBarButtonNotification, object: nil)
    }
}

//
//  ViewController.swift
//  Rainbow
//
//  Created by 최혜선 on 25/11/2019.
//  Copyright © 2019 ulike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rainbow: Rainbow!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(touchedTabBarAddButton(_:)), name: tabTabBarButtonNotification, object: nil)
    }
    
    @objc private func touchedTabBarAddButton(_ noti: Notification) {
        print("등록 버튼 클릭")
    }
}

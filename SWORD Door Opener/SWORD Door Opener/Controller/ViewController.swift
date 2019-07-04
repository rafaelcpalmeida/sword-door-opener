//
//  ViewController.swift
//  SWORD Door Opener
//
//  Created by Rafael Almeida on 03/07/2019.
//  Copyright © 2019 Rafael Almeida. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SlideButtonDelegate {
    @IBOutlet weak var openSlider: MMSlidingButton!
    @IBOutlet weak var floorSwitcher: HBSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.openSlider.delegate = self
        
        self.floorSwitcher.items = ["First floor", "Fourth floor"]
        self.floorSwitcher.selectedIndex = 0
        self.floorSwitcher.backgroundColor = UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 1.0)
        self.floorSwitcher.thumbColor = UIColor(red: 229/255, green: 9/255, blue: 43/255, alpha: 1.0)
        self.floorSwitcher.selectedLabelColor = .white
        self.floorSwitcher.unselectedLabelColor = .white
        self.floorSwitcher.borderColor = .clear
        self.floorSwitcher.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
    }
    
    
    func buttonStatus(status: String, sender: MMSlidingButton) {
        print(status)
        if(self.openSlider.unlocked) {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                self.openSlider.reset()
            })
        }
    }
    
    @objc func segmentValueChanged(_ sender: AnyObject?){
        print(self.floorSwitcher.selectedIndex)
    }
}


//
//  WeatherViewController.swift
//  Omnidash
//
//  Created by Jerry Wong on 3/14/15.
//  Copyright (c) 2015 Jerry Wong. All rights reserved.
//

import Cocoa

class WeatherViewController: WidgetBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer?.backgroundColor = NSColor.redColor().CGColor
    }
}

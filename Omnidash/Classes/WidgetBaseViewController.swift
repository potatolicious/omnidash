//
//  WidgetBaseViewController.swift
//  Omnidash
//
//  Created by Jerry Wong on 3/14/15.
//  Copyright (c) 2015 Jerry Wong. All rights reserved.
//

import Cocoa

class WidgetBaseViewController: NSViewController {

    let tileLocation : WidgetLocation
    let realRect : CGRect

    required init?(tileRect: WidgetLocation, realRect: CGRect) {
        self.tileLocation = tileRect
        self.realRect = realRect
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    override func loadView() {
        self.view = NSView(frame: CGRectZero)
        self.view.wantsLayer = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

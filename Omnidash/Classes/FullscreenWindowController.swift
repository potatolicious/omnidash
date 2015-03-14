//
//  FullscreenWindowController.swift
//  Omnidash
//
//  Created by Jerry Wong on 3/14/15.
//  Copyright (c) 2015 Jerry Wong. All rights reserved.
//

import Cocoa

class FullscreenWindowController: NSWindowController {

    override init() {
        let win = NSWindow(contentRect: NSMakeRect(100, 100, 1280, 720),
            styleMask: NSResizableWindowMask | NSTitledWindowMask,
            backing: NSBackingStoreType.Buffered,
            defer: true)
        super.init(window: win)
        self.finishWindowSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func finishWindowSetup() {
        let window = self.window!
        window.title = "Main Fullscreen Window"
        window.backgroundColor = NSColor.blackColor()
    }

}

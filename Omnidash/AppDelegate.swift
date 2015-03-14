//
//  AppDelegate.swift
//  Omnidash
//
//  Created by Jerry Wong on 3/14/15.
//  Copyright (c) 2015 Jerry Wong. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    var fsWindowController: FullscreenWindowController!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        self.fsWindowController = FullscreenWindowController()
        self.fsWindowController.window!.makeKeyAndOrderFront(self)
//        self.fsWindowController.showWindow(self)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}


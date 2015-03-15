//
//  FullscreenWindowController.swift
//  Omnidash
//
//  Created by Jerry Wong on 3/14/15.
//  Copyright (c) 2015 Jerry Wong. All rights reserved.
//

import Cocoa

class FullscreenWindowController: NSWindowController {

    let minimumTileSize : CGFloat = 180
    var widgets: [Widget]!
    var gridSizeX: UInt!
    var gridSizeY: UInt!
    var gridTileSize: CGSize!

    override init() {
        let xRes: CGFloat = 1280
        let yRes: CGFloat = 720
        let win = NSWindow(contentRect: NSMakeRect(100, 100, xRes, yRes),
            styleMask: NSResizableWindowMask | NSTitledWindowMask,
            backing: NSBackingStoreType.Buffered,
            defer: true)
        super.init(window: win)
        self.finishWindowSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.finishWindowSetup()
    }

    func finishWindowSetup() {
        let window = self.window!
        window.title = "Main Fullscreen Window"
        window.backgroundColor = NSColor.blackColor()

        // calculate grid
        self.gridSizeX = UInt(floor(window.frame.size.width / minimumTileSize))
        self.gridSizeY = UInt(floor(window.frame.size.height / minimumTileSize))

        self.gridTileSize = CGSizeMake(window.frame.size.width / CGFloat(gridSizeX),
                                       window.frame.size.height / CGFloat(gridSizeY))

        self.initializeAllWidgets()
    }

    func initializeAllWidgets() {
        let tile = WidgetLocation(x: 0, y: 0, width: 2, height: 2)
        let wvc = WeatherViewController(tileRect: tile, realRect: realRectFromLocation(tile))
        let widget = Widget(controller: wvc!, location: tile)
        self.widgets = [widget]
        self.addAndPlaceWidgets()
    }

    func addAndPlaceWidgets() {
        for widget in self.widgets {
            self.window!.contentView.addSubview(widget.controller.view)
            widget.controller.view.frame = widget.controller.realRect
        }
    }

    func realRectFromLocation(location: WidgetLocation) -> CGRect {
        var rect = CGRectZero
        rect.origin.x = CGFloat(location.x) * gridTileSize.width
        rect.origin.y = CGFloat(location.y) * gridTileSize.height
        rect.size.width = CGFloat(location.width) * gridTileSize.width
        rect.size.height = CGFloat(location.height) * gridTileSize.height
        return rect
    }

}

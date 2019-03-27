//
//  BlinkingLabel.swift
//  Pods
//
//  Created by Andy Obusek on 6/29/15.
//
//

/// A UILabel subclass that may be told to blink or stop blinking
public class BlinkingLabel : UILabel {

    /**
        Tells the label to start blinking.
    */
    public func startBlinking() {
    }

    /**
    Tells the label to stop blinking.
    */
    public func stopBlinking() {
        alpha = 1
        layer.removeAllAnimations()
    }
}

//
//  StopWatch.swift
//  Lodgman Service
//
//  Created by Banji Adewumi on 8/12/19.
//  Copyright © 2019 Banji Adewumi. All rights reserved.
//

import Foundation

class StopWatch {
    
    private var startTime: NSDate?
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime {
            return -startTime.timeIntervalSinceNow
        }
        else {
            return 0
        }
    }
    
    var isRunning: Bool {
        
        return (startTime != nil)
    }
    
    func start() {
        startTime = NSDate()
    }
    
    func stop() {
        startTime = nil
    }
    
}

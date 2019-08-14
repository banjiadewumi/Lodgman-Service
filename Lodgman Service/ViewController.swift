//
//  ViewController.swift
//  Lodgman Service
//
//  Created by Banji Adewumi on 8/12/19.
//  Copyright © 2019 Banji Adewumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let watch = StopWatch()
    var dayTime: String = ""
    
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var dayTimeLbl: UILabel!
    @IBOutlet weak var timeLastBusLeft: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        watch.start()
        timeOfDay()
        updateAllTime()
    }
    
    
    @IBAction func aboutPressed () {
        
        let controller : AboutViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: - Update Timer Label
    @objc func updateElapsedTimeLabel (timer: Timer){
        
        if watch.isRunning {
            let minutes = Int(watch.elapsedTime / 60)
            let seconds = Int(watch.elapsedTime) % 60
            timerLbl.text = String(format: "%02d:%02d", minutes, seconds)
        }
        else {
            timer.invalidate()
        }
    
    }
    
    
    // MARK: update all the times stamps
    func updateAllTime() {
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateElapsedTimeLabel(timer:)), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(timeOfDay), userInfo: nil, repeats: true)
        
       
    }
    
    
    // The accurate time of the day!
    @objc func timeOfDay(){
        
        dayTime = DateFormatter.localizedString(from: Date(), dateStyle: DateFormatter.Style.none, timeStyle: DateFormatter.Style.short)
        
        dayTimeLbl.text = dayTime
         timeSinceLastBusLeft()
    }
    
    func timeSinceLastBusLeft() {
     
        switch dayTime {
        case "8:00 AM", "8:30 AM", "9:00 AM","9:30 AM","10:00 AM","10:30 AM","11:00 AM","11:30 AM",
             "12:00 PM","1:00 PM","2:00 PM","3:00 PM","3:30 PM","4:00 PM","4:30 PM",
             "5:00 PM","5:30 PM","6:00 PM","7:00 PM","8:00 PM":
            timeLastBusLeft.text = dayTime
        default:
            return
        
        }
    }
    

}


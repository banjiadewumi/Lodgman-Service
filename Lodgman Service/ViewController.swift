//
//  ViewController.swift
//  Lodgman Service
//
//  Created by Banji Adewumi on 8/12/19.
//  Copyright © 2019 Banji Adewumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var dayTime: String = ""
    var nextBus: String = ""
    var timer = Timer()
    
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var dayTimeLbl: UILabel!
    @IBOutlet weak var timeLastBusLeft: UILabel!
    @IBOutlet weak var nextBusLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        timeOfDay()
        updateGlobaltime()
        
    }
    
    
    @IBAction func aboutPressed () {
        
        let controller : AboutViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        
        present(controller, animated: true, completion: nil)
    }
    
    
    
    
    // MARK: - Create a timner
    func recurringTimer(){
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timeResults(timer:)), userInfo: Date(), repeats: true)
        
    }
    
    @objc func timeResults(timer: Timer){
        let timerStart = timer.userInfo as! Date
        let seconds = Int(Date().timeIntervalSince(timerStart)) % 60
        let minutes = Int(Date().timeIntervalSince(timerStart)) / 60
        timerLbl.text = String(format: "%02d:%02d", minutes, seconds)
        
    }
    
    
    // MARK: update all the times stamps
    func updateGlobaltime() {
        
        
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
        case "6:57 AM", "8:30 AM", "9:00 AM","9:53 AM","10:54 AM","10:30 AM","11:00 AM","11:30 AM",
             "12:00 PM","1:00 PM","2:00 PM","3:00 PM","3:30 PM","4:00 PM","4:30 PM",
             "5:00 PM","5:30 PM","6:00 PM","7:00 PM","2:30 PM":
            
            let frozenTime = dayTime
            timeLastBusLeft.text = frozenTime
            recurringTimer()
            
            let minutesToAdd: TimeInterval = 30 * 60
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "h:mm a"
            let date = dateFormatter.date(from: frozenTime)
            let nextBusTime = date?.addingTimeInterval(minutesToAdd)
            nextBus = dateFormatter.string(from: nextBusTime ?? Date())
            nextBusLbl.text = nextBus
        default:
            return
        
        }
    }
    
    
    // MARK: bus Schedule transition
    @IBAction func busSchedulebutton() {
        
        let busSchedule: ScheduleViewController
        busSchedule = storyboard?.instantiateViewController(withIdentifier: "ScheduleViewController") as! ScheduleViewController
        
        present(busSchedule, animated: true, completion: nil)
    }
    

}


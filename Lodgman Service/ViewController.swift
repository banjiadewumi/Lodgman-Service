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
    
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var dayTimeLbl: UILabel!
    
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
    
    func updateAllTime() {
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateElapsedTimeLabel(timer:)), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(timeOfDay), userInfo: nil, repeats: true)
    }
    
    @objc func timeOfDay(){
        
        let dayTime = DateFormatter.localizedString(from: Date(), dateStyle: DateFormatter.Style.none, timeStyle: DateFormatter.Style.short)
        
        dayTimeLbl.text = dayTime
    }
    
    

}


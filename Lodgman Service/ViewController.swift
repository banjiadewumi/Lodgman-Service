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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateElapsedTimeLabel(timer:)), userInfo: nil, repeats: true)
        
        watch.start()
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
    
    

}


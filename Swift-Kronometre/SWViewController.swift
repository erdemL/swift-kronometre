//
//  SWViewController.swift
//  Swift-Kronometre
//
//  Created by Erdem  LAFCI on 26.01.2015.
//  Copyright (c) 2015 Erdem  LAFCI. All rights reserved.
//

import UIKit

class SWViewController: UIViewController {
    

    @IBOutlet weak var saat: UILabel!
    
    var baslangicZamani = NSTimeInterval()
    
    var zamanlayici:NSTimer = NSTimer()

    
    @IBAction func baslaButon(sender: UIButton) {
        if(!zamanlayici.valid) {
            let ayirici : Selector = "zamanGuncelleyici"
            zamanlayici = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: ayirici, userInfo: nil, repeats: true)
            baslangicZamani = NSDate.timeIntervalSinceReferenceDate()
            
        }
    }
    
    @IBAction func bitisButon(sender: UIButton) {
        zamanlayici.invalidate()
    }
    
    func zamanGuncelleyici() {
        
        var simdikiZaman = NSDate.timeIntervalSinceReferenceDate()
        
        var gecenZaman: NSTimeInterval = simdikiZaman - baslangicZamani
        
        let dakika = UInt8(gecenZaman / 60.0)
        gecenZaman -= (NSTimeInterval(dakika)*60)
        
        let saniye = UInt8(gecenZaman)
        gecenZaman -= NSTimeInterval(saniye)
        
        let salise = UInt8(gecenZaman * 100)
        
        
        let strDakika = dakika > 9 ? String(dakika):"0" + String(dakika)
        let strSaniye = saniye > 9 ? String(saniye):"0" + String(saniye)
        let strSalise = salise > 9 ? String(salise):"0" + String(salise)
        
        saat.text = "\(strDakika):\(strSaniye):\(strSalise)"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

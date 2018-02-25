//
//  ViewController.swift
//  SlidedhowApp
//
//  Created by asplate on 2018/02/18.
//  Copyright © 2018年 asplate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slide01: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var current_slide = 0
    var playing = false
    var canNext = true
    var canPrev = true
    
    var timer: Timer!
    // タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    let slideArray = [
        "cat01.jpg",
        "cat02.jpg",
        "cat03.jpg",
        ]
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var slideNum: UILabel!
    
    @IBAction func nextButton(_ sender: Any) {
        if(canNext == true) {
            if (current_slide == 2) {
                current_slide = -1
            }
            current_slide = current_slide + 1
            
            slide01.image = UIImage(named: slideArray[current_slide])
        }else{
            
            
        }
    }
    
    @IBAction func prevButton(_ sender: Any) {
        if(canPrev == true) {
            if (current_slide == 0) {
                current_slide = 3
            }
            current_slide = current_slide - 1
            
            slide01.image = UIImage(named: slideArray[current_slide])
        }else{
            
        }
    }
    
    @IBAction func startButton(_ sender: Any) {
        
        if (playing == true) {
            playing = false
            nextButton.isEnabled = true
            prevButton.isEnabled = true
            
            if self.timer != nil {
                self.timer.invalidate()   // 現在のタイマーを破棄する
                self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
                startButton.setTitle("再生", for: .normal)
            }
            
            
        }else{
            playing = true
            nextButton.isEnabled = false
            prevButton.isEnabled = false
            startButton.setTitle("停止", for: .normal)
            
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }
        }
    }
    
    
    // selector: #selector(updatetimer) で指定された関数
    // timeInterval: 0.1, repeats: true で指定された通り、0.1秒毎に呼び出され続ける
    @objc func updateTimer(timer: Timer) {
        self.timer_sec += 0.1
        //２で割ったあまりが0の時 %使用不可
        //if(self.timer_sec.truncatingRemainder(dividingBy: 2.0) == 0 ) {
        
        
        if (self.current_slide == 2) {
            self.current_slide = -1
        }
        
        self.current_slide += 1
        
        
        
        //}
        self.slideNum.text = String(self.current_slide)
        self.slide01.image = UIImage(named: self.slideArray[self.current_slide])
        self.timerLabel.text = String(format: "%.1f", self.timer_sec)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        slide01.image = UIImage(named: slideArray[current_slide])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapSlideImage(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
        playing = false
        nextButton.isEnabled = true
        prevButton.isEnabled = true
        startButton.setTitle("再生", for: .normal)
        
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "zoomImage", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let zoomImageViewController:zoomImageViewController = segue.destination as! zoomImageViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        zoomImageViewController.zoom_slide = self.current_slide
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}


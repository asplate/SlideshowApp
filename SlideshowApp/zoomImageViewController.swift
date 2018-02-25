//
//  zoomImageViewController.swift
//  SlideshowApp
//
//  Created by  on 2018/02/18.
//  Copyright © 2018年 asplate. All rights reserved.
//

import UIKit

class zoomImageViewController: UIViewController {
    var zoom_slide = 0
    
    let slideArray = [
        "cat01.jpg",
        "cat02.jpg",
        "cat03.jpg",
        ]
    
    @IBOutlet weak var zoomImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        zoomImage.image = UIImage(named: slideArray[zoom_slide])
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

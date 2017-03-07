//
//  DetailViewController.swift
//  SlideshowApp
//
//  Created by Hiromune Mitsuji on 2017/03/03.
//  Copyright © 2017年 hmitsuji. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var ebisuDetailImage: UIImageView!
  
    var ebisuDetail: UIImage?
    var ebisuCount2 = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      ebisuDetailImage.image = ebisuDetail
      print("\(ebisuCount2)が届いてます")
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

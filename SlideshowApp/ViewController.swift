//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Hiromune Mitsuji on 2017/03/02.
//  Copyright © 2017年 hmitsuji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var ebisuImageView: UIImageView!
  @IBOutlet weak var nextButton: UIButton!
  @IBOutlet weak var backButton: UIButton!
  @IBOutlet weak var slideShowButton: UIButton!

  var ebisuCount = 0
  var timer: Timer!
  var timer_sec: Double = 0.0
  var slideShowChange:Bool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    ebisuImageChange()
    ebisuImageView.isUserInteractionEnabled = true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let detailViewController:DetailViewController = segue.destination as! DetailViewController
    detailViewController.ebisuDetail = ebisuImageView.image!
    detailViewController.ebisuCount2 = ebisuCount
  }

  // Countを画像数で割って余りの数で画像の表示を変更
  func ebisuImageChange() {
    if ebisuCount%6 == 0 {
      ebisuImageView.image = UIImage(named: "ebisu1")
    } else if ebisuCount%6 == 1 {
      ebisuImageView.image = UIImage(named: "ebisu2")
    } else if ebisuCount%6 == 2 {
      ebisuImageView.image = UIImage(named: "ebisu3")
    } else if ebisuCount%6 == 3 {
      ebisuImageView.image = UIImage(named: "ebisu4")
    } else if ebisuCount%6 == 4 {
      ebisuImageView.image = UIImage(named: "ebisu5")
    } else if ebisuCount%6 == 5 {
      ebisuImageView.image = UIImage(named: "ebisu6")
    }
  }
  
  
  func slideShow() {
    if slideShowChange == true {
      print("ONだよ")
        if self.timer == nil {
          self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ebisuImageSlide), userInfo: nil, repeats: true)
        }
      nextButton.isEnabled = false
      backButton.isEnabled = false
      slideShowButton.setTitle("停止", for: .normal)
    } else if slideShowChange == false {
      print("OFFだよ")
        if self.timer != nil {
          self.timer.invalidate()   // 現在のタイマーを破棄する
          self.timer = nil          // 上記のtimer == nil で判断するために、timer = nil としておく
        }
      nextButton.isEnabled = true
      backButton.isEnabled = true
      slideShowButton.setTitle("再生", for: .normal)
    }
  }
  
  @IBAction func slideShowButtonTapped(_ sender: Any) {
    if slideShowChange == true {
      slideShowChange = false
    } else {
      slideShowChange = true
    }
    slideShow()
  }

  @IBAction func ImageViewTapped(_ sender: Any) {
    print("ボタンが押されています")
    slideShowChange = false
    slideShow()
  }
  
  func ebisuImageSlide(timer: Timer) {
    ebisuCount += 1
    if ebisuCount == 6 {
      ebisuCount = 0
    }
    ebisuImageChange()
  }

  @IBAction func nextButtonTapped(_ sender: Any) {
    ebisuCount += 1
    ebisuImageChange()
  }
  
  @IBAction func backButtonTapped(_ sender: Any) {
    ebisuCount -= 1
    if ebisuCount == -1 {
      ebisuCount = 5
    }
    ebisuImageChange()
  }
  
  @IBAction func returnToTop(segue: UIStoryboardSegue)  {
  }
  
}


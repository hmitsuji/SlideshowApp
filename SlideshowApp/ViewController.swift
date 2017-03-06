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
  var slideShowButtonCount = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    ebisuImageChange()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // segueから遷移先のResultViewControllerを取得する
    let detailViewController:DetailViewController = segue.destination as! DetailViewController
    // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
//    detailViewController.ebisuDetail = ebisuImageView.image!
    detailViewController.ebisuDetail = ebisuImageView.image!
    detailViewController.ebisuCount2 = ebisuCount
  }

  
  func ebisuImageChange() {
    if ebisuCount == 0 {
      ebisuImageView.image = UIImage(named: "ebisu1")
    } else if ebisuCount == 1 {
      ebisuImageView.image = UIImage(named: "ebisu2")
    } else if ebisuCount == 2 {
      ebisuImageView.image = UIImage(named: "ebisu3")
    } else if ebisuCount == 3 {
      ebisuImageView.image = UIImage(named: "ebisu4")
    } else if ebisuCount == 4 {
      ebisuImageView.image = UIImage(named: "ebisu5")
    } else if ebisuCount == 5 {
      ebisuImageView.image = UIImage(named: "ebisu6")
    }
  }
  
  @IBAction func slideShowButtonTapped(_ sender: Any) {
    slideShowButtonCount += 1
    if slideShowButtonCount%2 == 1 {
      print("ONだよ")
        if self.timer == nil {
          self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ebisuImageSlide), userInfo: nil, repeats: true)
        }
      nextButton.isEnabled = false
      backButton.isEnabled = false
      slideShowButton.setTitle("停止", for: .normal)
    } else if slideShowButtonCount%2 == 0 {
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
  
  
  func ebisuImageSlide(timer: Timer) {
    ebisuCount += 1
    if ebisuCount == 6 {
      ebisuCount = 0
    }
    ebisuImageChange()
  }

  @IBAction func nextButtonTapped(_ sender: Any) {
    ebisuCount += 1
    if ebisuCount == 6 {
      ebisuCount = 0
    }
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
      print("効いてます")
//    ebisuCount = etailViewController.
  }
  
}


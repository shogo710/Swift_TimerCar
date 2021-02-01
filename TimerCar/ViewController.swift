//
//  ViewController.swift
//  TimerCar
//
//  Created by Shogo Nobuhara on 2021/02/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var car: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // タイマーを作成する
        Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: #selector(self.step),
            userInfo: nil,
            repeats: true
        )
        
    }
    
    @objc func step() {
        // 水平方向へ移動
        car.center.x += 10
        
        // 右辺から外へ出たら
        let carWidth =  car.bounds.width
        if car.center.x > (view.bounds.width + carWidth / 2) {
            // 左辺の手前に戻す
            car.center.x = -carWidth
            
            // Y座標はランダムな高さに変更
            let viewH = view.bounds.height
            car.center.y = CGFloat(arc4random_uniform(UInt32(viewH)))
        }
    }

}


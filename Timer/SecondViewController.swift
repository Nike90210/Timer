//
//  SecondViewController.swift
//  Timer
//
//  Created by Jazzband on 15.04.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    // Переменная для начертания линий
    let shapeLayer = CAShapeLayer()
    
    @IBOutlet weak var secondLabel: UILabel!
    
    var timer = Timer()
    var timerSeconds = (60 * 60) * 16
    var isTimerRunning = false
   
     func runTimer (){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounting), userInfo: nil, repeats: true)
         isTimerRunning = true
     }
    
      @objc func timerCounting(){
          if timerSeconds < 1 {
              timer.invalidate()
          }else
          {
              timerSeconds -= 1
              secondLabel.text = timeString(time: TimeInterval(timerSeconds ))
          }
    }
    
// Создание формата для отрисовки часов , минут и секунд
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours,minutes,seconds)
    }
    
    // Анимация идет по часовой стрелке
//    private func stepCircleAnimation(){
//        let basicAnimation = CABasicAnimation(keyPath: "strokEnd" )
//        basicAnimation.toValue = 1
//        basicAnimation.duration = 1
//        basicAnimation.fillMode = .forwards
//        basicAnimation.isRemovedOnCompletion = false
//
//        shapeLayer.add(basicAnimation, forKey: "strokEnd")
//    }
    
    // Отрисовывание круга
   private  func bazierCircle(){
        
               let circularPath = UIBezierPath(arcCenter: view.center,
                                               radius: 100,
                                               startAngle: -(.pi / 2),
                                               endAngle: .pi * 2,
                                               clockwise: true)
               
               shapeLayer.path = circularPath.cgPath
               shapeLayer.strokeColor = UIColor.green.cgColor
               shapeLayer.strokeEnd = 0
               shapeLayer.fillColor = UIColor.clear.cgColor
               shapeLayer.lineWidth = 10
               shapeLayer.lineCap = .round

    }
    
    
  @objc  func didTapedButton(){
        let basicAnimation = CABasicAnimation(keyPath: "strokEnd" )
        basicAnimation.toValue = 1
        basicAnimation.duration = 1
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "animation")
    }
    
    // создание кнопки в ручную
    func buttonRun (){
        let button = UIButton(frame: CGRect(x: 20, y: view.frame.size.height-70, width: view.frame.size.width-40, height: 50))
        
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didTapedButton), for: .touchUpInside)
        view.addSubview(button)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.addSublayer(shapeLayer)
        buttonRun()
        runTimer()
       
    }
}

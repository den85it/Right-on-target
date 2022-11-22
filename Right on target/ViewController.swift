//
//  ViewController.swift
//  Right on target
//
//  Created by Дениc on 15.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
//        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
//        versionLabel.text = "Версия 1.1"
//        self.view.addSubview(versionLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
    }
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    private func getSecondViewController() -> SecondViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
        return viewController as! SecondViewController
    }
    
//    @IBAction func showNextScreen() {
//        self.present(secondViewController, animated: true, completion: nil)
//
//    }
    
    //zagadannoe chislo
    var number: Int = 0
    //raund
    var round: Int = 1
    //summa ochkov za raund
    var points: Int = 0
    
    @IBAction func checkNumber() {
        
            let numSlider = Int(self.slider.value.rounded())
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number
            } else if numSlider < self.number {
                self.points += 50 - self.number + numSlider
            } else {
                self.points += 50
            }
            if self.round == 5 {
                
                let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default))
                self.present(alert, animated: true)
                
                self.round = 1
                self.points = 0
            } else {
                self.round += 1
            }
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
        }
    }



//
//  ViewController.swift
//  RgbView
//
//  Created by Сергей Захаров on 25.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider(redLabel.text as Any)
        greenSlider(greenLabel.text as Any)
        blueSlider(blueLabel.text as Any)
    }
    
    private func changeColor() {
        coloredView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    

    @IBAction func redSlider(_ sender: Any) {
        changeColor()
        redLabel.text = redSlider.value.formatted(.number.precision(.fractionLength(2)))
    }
    
    @IBAction func greenSlider(_ sender: Any) {
        changeColor()
        greenLabel.text = greenSlider.value.formatted(.number.precision(.fractionLength(2)))
    }
    
    @IBAction func blueSlider(_ sender: Any) {
        changeColor()
        blueLabel.text = blueSlider.value.formatted(.number.precision(.fractionLength(2)))
    }
}


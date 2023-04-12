//
//  ViewController.swift
//  RgbView
//
//  Created by Сергей Захаров on 25.03.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    weak var colorDelegate: ColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 15
        changeColor()
        
        redSlider.value = UserDefaults.standard.float(forKey: "redSliderValue")
        greenSlider.value = UserDefaults.standard.float(forKey: "greenSliderValue")
        blueSlider.value = UserDefaults.standard.float(forKey: "blueSliderValue")
        
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        changeColor()
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
            UserDefaults.standard.set(redSlider.value, forKey: "redSliderValue")
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
            UserDefaults.standard.set(greenSlider.value, forKey: "greenSliderValue")
        default :
            blueLabel.text = string(from: blueSlider)
            UserDefaults.standard.set(blueSlider.value, forKey: "bluSliderValue")
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        colorDelegate?.didChangeColor(coloredView.backgroundColor ?? UIColor.clear)
        dismiss(animated: true)
    }
    
    private func changeColor() {
        let color = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        coloredView.backgroundColor = color
        colorDelegate?.didChangeColor(color)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

protocol ColorDelegate: AnyObject {
    func didChangeColor(_ color: UIColor)
}








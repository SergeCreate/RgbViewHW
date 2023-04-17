//
//  ViewController.swift
//  RgbView
//
//  Created by Сергей Захаров on 25.03.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    unowned var delegate: SettingsViewControllerDelegate!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 15
        
        coloredView.backgroundColor = viewColor
        
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        changeColor()
        switch sender {
        case redSlider:
            setValue(for: redLabel)
        case greenSlider:
            setValue(for: greenLabel)
        default :
            setValue(for: blueLabel)
        }
        
        changeColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.changeColor(coloredView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    private func changeColor() {
        coloredView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel: label.text = string(from: redSlider)
            case greenLabel: label.text = string(from: greenSlider)
            default: label.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for colorSliders: UISlider...) {
        let ciColor = CIColor(color: viewColor)
        colorSliders.forEach { slider in
            switch slider {
            case redSlider : redSlider.value = Float(ciColor.red)
            case greenSlider: greenSlider.value = Float(ciColor.green)
            default: blueSlider.value = Float(ciColor.blue)
            }
        }
    }
}









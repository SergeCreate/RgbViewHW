//
//  MainViewController.swift
//  RgbView
//
//  Created by Сергей Захаров on 12.04.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            vc.colorDelegate = self
        }
    }
}
extension MainViewController : ColorDelegate {
    func didChangeColor(_ color: UIColor) {
        backgroundView.backgroundColor = color
    }
}






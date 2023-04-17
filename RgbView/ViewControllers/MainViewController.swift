//
//  MainViewController.swift
//  RgbView
//
//  Created by Сергей Захаров on 12.04.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func changeColor(_ color: UIColor)
}

final class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.viewColor = view.backgroundColor
    }
}

extension MainViewController : SettingsViewControllerDelegate {
    func changeColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}






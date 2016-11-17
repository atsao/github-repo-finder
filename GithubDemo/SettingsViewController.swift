//
//  SettingsTableViewController.swift
//  GithubDemo
//
//  Created by Andrew Tsao on 11/7/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

protocol SettingsTableViewControllerDelegate: class {
    func didUpdateSearchSettings(sender: SettingsTableViewController, settings: GithubRepoSearchSettings)
}

class SettingsTableViewController: UITableViewController {
    
    weak var delegate:SettingsTableViewControllerDelegate?
    
    var currentSettings = GithubRepoSearchSettings()
    var originalSettings = GithubRepoSearchSettings()
    
    @IBOutlet weak var minimumStarsLabel: UILabel!
    @IBOutlet weak var minimumStarsSlider: UISlider!
    @IBOutlet weak var filterByLanguagesSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        minimumStarsLabel.text = "\(currentSettings.minStars)"
        minimumStarsSlider.value = Float(currentSettings.minStars)
        originalSettings = currentSettings
    }
    
    @IBAction func handleCancelButtonTapped(_ sender: Any) {
        delegate?.didUpdateSearchSettings(sender: self, settings: originalSettings)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func handleSaveButtonTapped(_ sender: Any) {
        delegate?.didUpdateSearchSettings(sender: self, settings: currentSettings)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleMinimumStarsSliderChanged(_ sender: Any) {
        let newMinStars = Int(minimumStarsSlider.value)
        minimumStarsLabel.text = "\(newMinStars)"
        currentSettings.minStars = newMinStars
    }

    @IBAction func handleFilterByLanguageSwitchChanged(_ sender: UISwitch) {
        let isFilterActive = sender.isOn
        if (!isFilterActive) {
            currentSettings.languages = []
        }
        currentSettings.isLanguageFilterActive = isFilterActive
    }
    
    func renderLanguageFilters() {

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 1
        }
    }

}

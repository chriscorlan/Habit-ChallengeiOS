//
//  CravingsIntensityVC.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 4/28/18.
//  Copyright © 2018 Chad Wiedemann LLC. All rights reserved.
//

import UIKit

class CravingsIntensityVC: UIViewController {

    @IBOutlet weak var cravingSlider: UISlider!
    var cravings = [Craving]()
    var selectedCravingIndex = 0
    
    @IBOutlet weak var cravingsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cravings = Craving.getAllCravings()
        let nib = UINib.init(nibName: "CravingTableViewCell", bundle: nil)
        cravingsTableView.register(nib, forCellReuseIdentifier: "cravingCell")
        setTargetActionForSlider()
    }
    
    func setTargetActionForSlider() {
        cravingSlider.addTarget(self, action: #selector(CravingsIntensityVC.sliderChanged), for: .valueChanged)
    }
    
    @objc func sliderChanged() {
        if !cravings.isEmpty{
            cravings[selectedCravingIndex].intensity = Int(self.cravingSlider.value.rounded())
            var arr = [String]()
            for craving in cravings {
                arr.append(craving.name + String(craving.intensity))
            }
            UserDefaults.standard.set(arr, forKey: "cravings")
            self.cravingsTableView.reloadData()
        }
        
    }
    
    
    @IBAction func addATriggerButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Input Craving Name", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in
            
            
        })
        alert.addTextField(configurationHandler: nil)
        alert.addAction(cancel)
        alert.addAction(UIAlertAction.init(title: "Okay", style: .cancel, handler: { (action) in
            if let textField = alert.textFields?.first{
                Craving.add(craving: Craving.init(name: textField.text ?? "", intensity: Int(self.cravingSlider.value.rounded())))
                self.cravings = Craving.getAllCravings()
                self.cravingsTableView.reloadData()
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        if !cravings.isEmpty {
            cravings.remove(at: selectedCravingIndex)
            (selectedCravingIndex == 0) ? (selectedCravingIndex = 0) : (selectedCravingIndex = selectedCravingIndex - 1)
            var arr = [String]()
            for craving in cravings {
                arr.append(craving.name + String(craving.intensity))
            }
            UserDefaults.standard.set(arr, forKey: "cravings")
            self.cravingsTableView.reloadData()
        }
        
    }
}

extension CravingsIntensityVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cravings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CravingTableViewCell = self.cravingsTableView.dequeueReusableCell(withIdentifier: "cravingCell", for: indexPath) as! CravingTableViewCell
        cell.cravingLevelLabel.text = String(cravings[indexPath.row].intensity)
        cell.cravingNameLabel.text = cravings[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cravingSlider.setValue( Float(cravings[indexPath.row].intensity), animated: true)
        selectedCravingIndex = indexPath.row
    }
}

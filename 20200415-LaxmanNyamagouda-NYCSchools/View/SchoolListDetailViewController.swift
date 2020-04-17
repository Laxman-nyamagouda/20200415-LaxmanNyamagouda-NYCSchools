//
//  SchoolListDetailViewController.swift
//  20200415-LaxmanNyamagouda-NYCSchools
//
//  Created by Laxman Nyamagouda on 4/16/20.
//  Copyright © 2020 Laxman Nyamagouda. All rights reserved.
//

import Foundation
import UIKit

class SchoolListDetailViewController: UIViewController {
    
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var numOfSatTestTakers: UILabel!
    @IBOutlet weak var satMathAvgScore: UILabel!
    @IBOutlet weak var satWritingAvgScore: UILabel!
    @IBOutlet weak var satCriticalReadingAvgScore: UILabel!
    
    var viewModel: SchoolDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Details"
        
        guard (viewModel?.selectedSchoolFromSchoolList) != nil else {
            showAlert()
            return
        }
        
        if let schoolName = viewModel?.selectedSchoolFromSchoolList?.schoolName {
            self.schoolName.text = "School Name: \n\(schoolName)"
        }
        if let numOfSatTestTakers = viewModel?.selectedSchoolFromSchoolList?.numOfSatTestTakers {
            self.numOfSatTestTakers.text = "Number of SAT Test Takers: \n\(numOfSatTestTakers)"
        }
        if let satCriticalReadingAvgScore = viewModel?.selectedSchoolFromSchoolList?.satCriticalReadingAvgScore {
            self.satCriticalReadingAvgScore.text = "SAT critical reading avg score: \n\(satCriticalReadingAvgScore)"
        }
        if let satMathAvgScore = viewModel?.selectedSchoolFromSchoolList?.satMathAvgScore {
            self.satMathAvgScore.text = "SAT Math Avg Score: \n\(satMathAvgScore)"
        }
        if let satWritingAvgScore = viewModel?.selectedSchoolFromSchoolList?.satWritingAvgScore {
            self.satWritingAvgScore.text = "SAT Writing Avg Score: \n\(satWritingAvgScore)"
        }
        
    }
    
    // MARK: - Show alert in case service did not return any results
    private func showAlert() {
        // MARL: - title can be App name and any relevent message can be displayed
        let alert = UIAlertController(title: "JP Chase", message: "Record not found for this School. Please check later", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
               UIAlertAction in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

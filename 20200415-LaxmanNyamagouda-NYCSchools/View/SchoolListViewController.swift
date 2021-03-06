//
//  ViewController.swift
//  20200415-LaxmanNyamagouda-NYCSchools
//
//  Created by Laxman Nyamagouda on 4/15/20.
//  Copyright © 2020 Laxman Nyamagouda. All rights reserved.
//

import UIKit

class SchoolListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Dependency Injection
    let viewModel = SchoolListViewModel(dataService: DataService())    
    var didSelectSchool: ((_ index: Int) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getSchoolList()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Networking - get school list
    private func getSchoolList() {

        viewModel.fetchSchoolList()
        viewModel.fetchSATResults()
        self.activityIndicatorStart()
        
        viewModel.showAlertClosure = { [weak self] in
            if let error = self?.viewModel.error {
                //UI must be updated on main thread
                DispatchQueue.main.async {
                    self?.showAlert()
                    self?.activityIndicatorStop()
                }
                print(error.localizedDescription)
            }
        }
        
        viewModel.didFinishFetch = { [weak self] in
            //UI must be updated on main thread
            DispatchQueue.main.async {
                self?.activityIndicatorStop()
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Show alert in case service did not return any results
    private func showAlert() {
        // MARL: - title can be App name and any relevent message can be displayed
        let alert = UIAlertController(title: "JP Chase", message: "Someting went wrong. Please Chaeck back later", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Set up Activity indicator start and Activity indicator stop
    private func activityIndicatorStart() {
        //Activity indicator start
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.startAnimating()
    }
    
    private func activityIndicatorStop() {
        //Activity indicator stop
        self.activityIndicator.stopAnimating()
    }
}

// MARK: - Seperate out the tableview functionality from View controller
extension SchoolListViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if let schoolList = viewModel.schoolList {
            return schoolList.count
        }
        return 0
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolListTableViewCell") as! SchoolListTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = viewModel.schoolList?[indexPath.row].schoolName
        return cell
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants().tableViewHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel.schoolSelected(index: indexPath.row)
        let detailViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SchoolListDetailViewController") as? SchoolListDetailViewController
        detailViewController?.viewModel = SchoolDetailsViewModel(selectedSchoolFromSchoolList: viewModel.selectedSchoolFromSchoolList)
        self.navigationController?.pushViewController(detailViewController!, animated: true)
    }
 
}

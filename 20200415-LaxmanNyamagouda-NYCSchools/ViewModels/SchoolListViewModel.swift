//
//  SchoolListViewModel.swift
//  20200415-LaxmanNyamagouda-NYCSchools
//
//  Created by Laxman Nyamagouda on 4/16/20.
//  Copyright © 2020 Laxman Nyamagouda. All rights reserved.
//

import Foundation

class SchoolListViewModel {
    
    // MARK: - Properties
    var schoolList: [NYCSchoolListResponseDataModelElement]? {
        didSet {
            self.didFinishFetch?()
        }
    }
    var schoolSATResults: [SATResultResponseDataModelElement]?
    var selectedSchoolFromSchoolList: SATResultResponseDataModelElement?
    
    private var dataService: DataService?
    var schoolTitleString: String?
    var albumIdString: String?
    var error: Error? {
         didSet { self.showAlertClosure?() }
     }
    
    // MARK: - Closures for callback
    var showAlertClosure: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    // MARK: - Network call
    func fetchSchoolList() {
        self.dataService?.requestFetchSchoolList(completion: { (schoolList, error) in
            if let error = error {
                self.error = error
                return
            }
            self.error = nil
            self.schoolList = schoolList
        })
    }
    
    // MARK: - Network call
    func fetchSATResults() {
        self.dataService?.requestFetchSATResults(completion: { (schoolSATResults, error) in
            if let error = error {
                self.error = error
                return
            }
            self.error = nil
            self.schoolSATResults = schoolSATResults
        })
    }
    
    func schoolSelected(index: Int) {
        
        if let schoolSATResults = self.schoolSATResults, schoolSATResults.count > 0, let schoolList = self.schoolList, schoolList.count > 0 {
            if index < schoolSATResults.count - 1 {
                let selectedSchool = schoolList[index]
                print(selectedSchool.schoolName as Any)
                
                for schoolResults in schoolSATResults {
                    if case schoolResults.dbn = selectedSchool.dbn {
                        self.selectedSchoolFromSchoolList = schoolResults
                        return
                    } else {
                        self.selectedSchoolFromSchoolList = nil
                    }
                }
            }
            
        }
    }

    // MARK: - UI Logic
//    private func setupSchoolList(with schoolList: [NYCSchoolListResponseDataModelElement]) {
//        if let schoolList = schoolList{
//            self.schoolTitleString = schoolList
//            self.albumIdString = "Album ID for this photo : \(albumId)"
//
//            // formatting url from http to https
//            guard let formattedUrlString = String.replaceHttpToHttps(with: urlString), let url = URL(string: formattedUrlString) else {
//                return
//            }
//            self.photoUrl = url
//        }
//    }
}

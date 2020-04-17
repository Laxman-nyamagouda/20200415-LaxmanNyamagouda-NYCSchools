//
//  SchoolListViewModel.swift
//  20200415-LaxmanNyamagouda-NYCSchools
//
//  Created by Laxman Nyamagouda on 4/16/20.
//  Copyright © 2020 Laxman Nyamagouda. All rights reserved.
//

import Foundation

final class SchoolListViewModel {
    
    // MARK: - Properties
    var schoolList: [NYCSchoolListResponseDataModelElement]? {
        didSet {
            self.didFinishFetch?()
        }
    }

    // Make variables private wherever possible
    var schoolSATResults: [SATResultResponseDataModelElement]?
    var selectedSchoolFromSchoolList: SATResultResponseDataModelElement?

    private let dataService: DataService?
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
        self.dataService?.requestFetchSchoolList(completion: { [weak self] (schoolList, error)  in
            guard let schoolList = schoolList else {
                self?.error = error
                return
            }
            self?.error = nil
            self?.schoolList = schoolList
        })
    }
    
    // MARK: - Network call
    func fetchSATResults() {
        self.dataService?.requestFetchSATResults(completion: { [weak self] (schoolSATResults, error) in
            guard let schoolSATResults = schoolSATResults else {
                self?.error = error
                return
            }
            self?.error = nil
            self?.schoolSATResults = schoolSATResults
        })
    }
    
    func schoolSelected(index: Int) {
        guard let schoolSATResults = self.schoolSATResults,
            schoolSATResults.count > 0,
            let schoolList = self.schoolList,
            schoolList.count > 0,
            index < schoolSATResults.count - 1 else { return }

        let selectedSchool = schoolList[index]
        if let i = schoolSATResults.firstIndex(where: { $0.dbn ==  selectedSchool.dbn}) {
            self.selectedSchoolFromSchoolList = schoolSATResults[i]
        } else {
            self.selectedSchoolFromSchoolList = nil
        }
    }
}

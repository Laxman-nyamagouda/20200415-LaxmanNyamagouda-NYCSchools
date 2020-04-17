//
//  NYCSchoolListResponseDataModel.swift
//  20200415-LaxmanNyamagouda-NYCSchools
//
//  Created by Laxman Nyamagouda on 4/15/20.
//  Copyright © 2020 Laxman Nyamagouda. All rights reserved.
//

import Foundation

// MARK: - NYCSchoolListResponseDataModel
typealias SchoolListResponseDataModel = [NYCSchoolListResponseDataModelElement]

// MARK: - NYCSchoolListResponseDataModelElement
class NYCSchoolListResponseDataModelElement: Codable {
    var dbn, schoolName: String

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
    }

    init(dbn: String, schoolName: String) {
        self.dbn = dbn
        self.schoolName = schoolName
    }
}




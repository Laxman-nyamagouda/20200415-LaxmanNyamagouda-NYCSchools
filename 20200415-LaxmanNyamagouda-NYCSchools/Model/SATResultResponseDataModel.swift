//
//  SATResultResponseDataModel.swift
//  20200415-LaxmanNyamagouda-NYCSchools
//
//  Created by Laxman Nyamagouda on 4/15/20.
//  Copyright © 2020 Laxman Nyamagouda. All rights reserved.
//

import Foundation

// MARK: - SATResultResponseDataModel
typealias SATResultResponseDataModel = [SATResultResponseDataModelElement]

// MARK: - SATResultResponseDataModelElement
class SATResultResponseDataModelElement: Codable {
    var dbn, schoolName, numOfSatTestTakers, satCriticalReadingAvgScore: String?
    var satMathAvgScore, satWritingAvgScore: String?
    var instructions: [String]?

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
        case instructions
    }

    init(dbn: String?, schoolName: String?, numOfSatTestTakers: String?, satCriticalReadingAvgScore: String?, satMathAvgScore: String?, satWritingAvgScore: String?, instructions: [String]?) {
        self.dbn = dbn
        self.schoolName = schoolName
        self.numOfSatTestTakers = numOfSatTestTakers
        self.satCriticalReadingAvgScore = satCriticalReadingAvgScore
        self.satMathAvgScore = satMathAvgScore
        self.satWritingAvgScore = satWritingAvgScore
        self.instructions = instructions
    }
}


//
//  Constants.swift
//  20200415-LaxmanNyamagouda-NYCSchools
//
//  Created by Laxman Nyamagouda on 4/16/20.
//  Copyright © 2020 Laxman Nyamagouda. All rights reserved.
//

import Foundation


struct HeaderFieldNames {
    static let appToken = "Iq0FhLMwcaTMIANKx5RN8lFuq"
    static let appTokenKey = "$$app_token"
    static let limitKey = "$limit"
    static let limit = "4000"
}

struct Constants {
    
    // MARK: - URL
    let schoolListUrl = URL(string: constructSchoolListURLString())
    let satScoreUrl = URL(string: constructSATResultsURLString())
    
    public static func constructSchoolListURLString() -> String {
        let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?\(HeaderFieldNames.limitKey)=\(HeaderFieldNames.limit)&\(HeaderFieldNames.appTokenKey)=\(HeaderFieldNames.appToken)"
        return urlString
    }
    
    public static func constructSATResultsURLString() -> String {
        let urlString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?\(HeaderFieldNames.limitKey)=\(HeaderFieldNames.limit)&\(HeaderFieldNames.appTokenKey)=\(HeaderFieldNames.appToken)"
        return urlString
    }
}

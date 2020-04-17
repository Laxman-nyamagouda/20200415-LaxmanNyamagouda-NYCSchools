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
@objcMembers class NYCSchoolListResponseDataModelElement: NSObject, Codable {
    var dbn, schoolName, boro, overviewParagraph: String?
    var school10ThSeats, academicopportunities1, academicopportunities2, ellPrograms: String?
    var neighborhood, buildingCode, location, phoneNumber: String?
    var faxNumber, schoolEmail, website, subway: String?
    var bus, grades2018, finalgrades, totalStudents: String?
    var extracurricularActivities, schoolSports, attendanceRate, pctStuEnoughVariety: String?
    var pctStuSafe, schoolAccessibilityDescription, directions1, requirement11: String?
    var requirement21, requirement31, requirement41, requirement51: String?
    var offerRate1, program1, code1, interest1: String?
    var method1, seats9Ge1, grade9Gefilledflag1, grade9Geapplicants1: String?
    var seats9Swd1, grade9Swdfilledflag1, grade9Swdapplicants1, seats101: String?
    var admissionspriority11, admissionspriority21, admissionspriority31, grade9Geapplicantsperseat1: String?
    var grade9Swdapplicantsperseat1, primaryAddressLine1, city, zip: String?
    var stateCode, latitude, longitude, communityBoard: String?
    var councilDistrict, censusTract, bin, bbl: String?
    var nta, borough: String?
    var instructions: [String]?

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case boro
        case overviewParagraph = "overview_paragraph"
        case school10ThSeats = "school_10th_seats"
        case academicopportunities1, academicopportunities2
        case ellPrograms = "ell_programs"
        case neighborhood
        case buildingCode = "building_code"
        case location
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case website, subway, bus, grades2018, finalgrades
        case totalStudents = "total_students"
        case extracurricularActivities = "extracurricular_activities"
        case schoolSports = "school_sports"
        case attendanceRate = "attendance_rate"
        case pctStuEnoughVariety = "pct_stu_enough_variety"
        case pctStuSafe = "pct_stu_safe"
        case schoolAccessibilityDescription = "school_accessibility_description"
        case directions1
        case requirement11 = "requirement1_1"
        case requirement21 = "requirement2_1"
        case requirement31 = "requirement3_1"
        case requirement41 = "requirement4_1"
        case requirement51 = "requirement5_1"
        case offerRate1 = "offer_rate1"
        case program1, code1, interest1, method1
        case seats9Ge1 = "seats9ge1"
        case grade9Gefilledflag1 = "grade9gefilledflag1"
        case grade9Geapplicants1 = "grade9geapplicants1"
        case seats9Swd1 = "seats9swd1"
        case grade9Swdfilledflag1 = "grade9swdfilledflag1"
        case grade9Swdapplicants1 = "grade9swdapplicants1"
        case seats101, admissionspriority11, admissionspriority21, admissionspriority31
        case grade9Geapplicantsperseat1 = "grade9geapplicantsperseat1"
        case grade9Swdapplicantsperseat1 = "grade9swdapplicantsperseat1"
        case primaryAddressLine1 = "primary_address_line_1"
        case city, zip
        case stateCode = "state_code"
        case latitude, longitude
        case communityBoard = "community_board"
        case councilDistrict = "council_district"
        case censusTract = "census_tract"
        case bin, bbl, nta, borough, instructions
    }

    init(dbn: String?, schoolName: String?, boro: String?, overviewParagraph: String?, school10ThSeats: String?, academicopportunities1: String?, academicopportunities2: String?, ellPrograms: String?, neighborhood: String?, buildingCode: String?, location: String?, phoneNumber: String?, faxNumber: String?, schoolEmail: String?, website: String?, subway: String?, bus: String?, grades2018: String?, finalgrades: String?, totalStudents: String?, extracurricularActivities: String?, schoolSports: String?, attendanceRate: String?, pctStuEnoughVariety: String?, pctStuSafe: String?, schoolAccessibilityDescription: String?, directions1: String?, requirement11: String?, requirement21: String?, requirement31: String?, requirement41: String?, requirement51: String?, offerRate1: String?, program1: String?, code1: String?, interest1: String?, method1: String?, seats9Ge1: String?, grade9Gefilledflag1: String?, grade9Geapplicants1: String?, seats9Swd1: String?, grade9Swdfilledflag1: String?, grade9Swdapplicants1: String?, seats101: String?, admissionspriority11: String?, admissionspriority21: String?, admissionspriority31: String?, grade9Geapplicantsperseat1: String?, grade9Swdapplicantsperseat1: String?, primaryAddressLine1: String?, city: String?, zip: String?, stateCode: String?, latitude: String?, longitude: String?, communityBoard: String?, councilDistrict: String?, censusTract: String?, bin: String?, bbl: String?, nta: String?, borough: String?, instructions: [String]?) {
        self.dbn = dbn
        self.schoolName = schoolName
        self.boro = boro
        self.overviewParagraph = overviewParagraph
        self.school10ThSeats = school10ThSeats
        self.academicopportunities1 = academicopportunities1
        self.academicopportunities2 = academicopportunities2
        self.ellPrograms = ellPrograms
        self.neighborhood = neighborhood
        self.buildingCode = buildingCode
        self.location = location
        self.phoneNumber = phoneNumber
        self.faxNumber = faxNumber
        self.schoolEmail = schoolEmail
        self.website = website
        self.subway = subway
        self.bus = bus
        self.grades2018 = grades2018
        self.finalgrades = finalgrades
        self.totalStudents = totalStudents
        self.extracurricularActivities = extracurricularActivities
        self.schoolSports = schoolSports
        self.attendanceRate = attendanceRate
        self.pctStuEnoughVariety = pctStuEnoughVariety
        self.pctStuSafe = pctStuSafe
        self.schoolAccessibilityDescription = schoolAccessibilityDescription
        self.directions1 = directions1
        self.requirement11 = requirement11
        self.requirement21 = requirement21
        self.requirement31 = requirement31
        self.requirement41 = requirement41
        self.requirement51 = requirement51
        self.offerRate1 = offerRate1
        self.program1 = program1
        self.code1 = code1
        self.interest1 = interest1
        self.method1 = method1
        self.seats9Ge1 = seats9Ge1
        self.grade9Gefilledflag1 = grade9Gefilledflag1
        self.grade9Geapplicants1 = grade9Geapplicants1
        self.seats9Swd1 = seats9Swd1
        self.grade9Swdfilledflag1 = grade9Swdfilledflag1
        self.grade9Swdapplicants1 = grade9Swdapplicants1
        self.seats101 = seats101
        self.admissionspriority11 = admissionspriority11
        self.admissionspriority21 = admissionspriority21
        self.admissionspriority31 = admissionspriority31
        self.grade9Geapplicantsperseat1 = grade9Geapplicantsperseat1
        self.grade9Swdapplicantsperseat1 = grade9Swdapplicantsperseat1
        self.primaryAddressLine1 = primaryAddressLine1
        self.city = city
        self.zip = zip
        self.stateCode = stateCode
        self.latitude = latitude
        self.longitude = longitude
        self.communityBoard = communityBoard
        self.councilDistrict = councilDistrict
        self.censusTract = censusTract
        self.bin = bin
        self.bbl = bbl
        self.nta = nta
        self.borough = borough
        self.instructions = instructions
    }
}




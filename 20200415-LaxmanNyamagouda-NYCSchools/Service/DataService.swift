//
//  DataService.swift
//  20200415-LaxmanNyamagouda-NYCSchools
//
//  Created by Laxman Nyamagouda on 4/16/20.
//  Copyright © 2020 Laxman Nyamagouda. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case FoundNil(String)
    case Success(String)
}

class DataService {
    
    // MARK: - Singleton
    static let shared: DataService = {
          let instance = DataService()
          return instance
      }()
    
    // MARK: - Service to get school list
    func requestFetchSchoolList(completion: @escaping (SchoolListResponseDataModel?, Error?) -> ()) {
        guard let url = Constants().schoolListUrl else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    completion(nil, error)
                    return }
            do {
                if let model = try? JSONDecoder().decode(SchoolListResponseDataModel.self, from: dataResponse) {
                    completion(model, nil)
                    return
                } else {
                    throw NetworkError.FoundNil("Unable to map dataResponse to Object Model")
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    // MARK: - Service to get school list
     func requestFetchSATResults(completion: @escaping (SATResultResponseDataModel?, Error?) -> ()) {
         guard let url = Constants().satScoreUrl else {return}
            
        makeNetworkCall(url: url) { (data, error) in
            guard let dataResponse = data, error == nil else { return}
            do {
                if let model = try? JSONDecoder().decode(SATResultResponseDataModel.self, from: dataResponse) {
                    completion(model, nil)
                    return
                } else {
                    throw NetworkError.FoundNil("Unable to map dataResponse to Object Model")
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
     }
    //Future: We can cache the response of network calls if its static static content and not changing for a while
    func makeNetworkCall(url: URL, completion: @escaping (Data?, Error?) -> ()) {
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    completion(nil, error)
                    return
            }
            completion(dataResponse, nil)
        }
        task.resume()
    }
}

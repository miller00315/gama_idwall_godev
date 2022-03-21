//
//  PersonService.swift
//  aula_11_atividade
//
//  Created by Idwall Go Dev 001 on 21/03/22.
//

import UIKit
import Foundation

enum PersonError: Error {
    case urlInvalid
    case noPreccessData
    case noDataAvailable
}

protocol ServicesProtocol {
    func getPersons(completition: @escaping(Result<[Person], PersonError>) -> Void)
}

class PersonService: ServicesProtocol {
    let session = URLSession.shared
    
    let url = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
    
    static var shared: PersonService = {
        let instance = PersonService()
        
        return instance
    }()
    
    func getPersons(completition: @escaping (Result<[Person], PersonError>) -> Void) {
        
        guard let url = URL(string: url) else {return completition(.failure(.urlInvalid))}
        
        let dataTask = session.dataTask(with: url) { data, _, _ in
            do {
                guard let jsonData = data else {return completition(.failure(.noDataAvailable))}
                
                let decoder = JSONDecoder()
                
                let persons = try decoder.decode([Person].self, from: jsonData)
                
                completition(.success(persons))
            }
            catch {
                completition(.failure(.noPreccessData))
            }
        }
        
        dataTask.resume()
    }
}

//
//  ServicesApi.swift
//  DependenceInject
//
//  Created by Idwall Go Dev 001 on 30/03/22.
//

import Foundation
import UIKit

enum UserError: Error {
    case error(String)
    case urlInvalid
    case noDataAvalaible
    case noProcessData
}

typealias completion = (Result<[User], Error>) -> Void

protocol ServicesProtocol: AnyObject {
    func getUsers(completion: @escaping completion)
}

class ServicesApi: ServicesProtocol {
    func getUsers(completion: @escaping completion) {
        let users = [User(name: "sou", mail: "a@a.com")]
        
        completion(.success(users))
    }
}

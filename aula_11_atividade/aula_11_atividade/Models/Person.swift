//
//  Person.swift
//  aula_11_atividade
//
//  Created by Idwall Go Dev 001 on 21/03/22.
//

import Foundation

struct Person: Codable {
    var id: Int
    var name: String
    var photo: String
    var company: Company
}

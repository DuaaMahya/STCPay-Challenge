//
//  SenatorsModel.swift
//  STCPay-Challenge
//
//  Created by Duaa on 01/06/1442 AH.
//

import Foundation

struct SenatorsResponse: Codable {
    let objects: [Object]
}

struct Object: Codable {
    let description: String
    let party: String
    let person: Person
    let role_type_label: String
    let extra: Extra
    let website: String
    let enddate: String
    let phone: String
}

struct Person: Codable {
    let firstname: String
    let lastname: String
    let sortname: String
    let gender_label: String
    let bioguideid: String
    let birthday: String
    let link: String
}

struct Extra: Codable {
    let address: String
    let office: String
}

//
//  Country.swift
//  CountryExplore
//
//  Created by Nikola Grdanoski on 19.6.25.
//

import SwiftUI

struct Country: Identifiable {
    var id: String
    
    let name: String
    let language: String
    let capital: String
    let continent: String
    let tld: String
    let flag: String
    let lt: String
    let ln: String
    let poi: String
}

struct allC {
    var all: [Country]
}

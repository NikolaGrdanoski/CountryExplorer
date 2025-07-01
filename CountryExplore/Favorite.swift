//
//  Favorite.swift
//  CountryExplore
//
//  Created by Nikola Grdanoski on 1.7.25.
//

import SwiftUI

struct Favorite: Identifiable {
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
    let email: String
}

struct allF {
    var all: [Favorite]
}

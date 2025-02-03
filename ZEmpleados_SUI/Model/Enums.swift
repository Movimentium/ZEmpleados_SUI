//  Enums.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 3/2/25.

import Foundation

enum Departamento: String, Codable, CaseIterable, Identifiable {
    case accounting = "Accounting"
    case businessDevelopment = "Business Development"
    case engineering = "Engineering"
    case humanResources = "Human Resources"
    case legal = "Legal"
    case marketing = "Marketing"
    case productManagement = "Product Management"
    case researchAndDevelopment = "Research and Development"
    case sales = "Sales"
    case services = "Services"
    case support = "Support"
    case training = "Training"
    
    var id: Self { self }  // ZTip (better)
}

enum Genero: String, Codable, CaseIterable, Identifiable {
    case female = "Female"
    case male = "Male"
    
    var id: String { self.rawValue }  // ZTip
}

enum SortType: String, CaseIterable, Identifiable {
    case ascendent = "Ascendent"
    case descendent = "Descendent"
    case byID = "By ID"
    
    var id: Self { self }
}


// Remember CaseIterable:  ZTip
// let casosGenero = Genero.allCases

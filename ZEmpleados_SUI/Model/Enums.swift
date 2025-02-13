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
    case ascendent = "Ascendente"
    case descendent = "Descendente"
    case byID = "Por ID"
    
    var id: Self { self }
}

enum EmpleadoEditTextField: Int, CaseIterable {
    case firstName = 0
    case lastName
    case address
    case zipcode
    case email
    case username
    
    private var count: Int {
        Self.allCases.count
    }
    
    private var lastCaseIdx: Int {
        count - 1
    }
    
    mutating func next() {
        let idx = self.rawValue + 1 == count ? 0 : self.rawValue + 1
        self = Self.allCases[idx]
    }
    
    mutating func prev() {
        let idx = self.rawValue - 1 < 0 ? lastCaseIdx : self.rawValue - 1
        self = Self.allCases[idx]
    }
}


// Remember CaseIterable:  ZTip
// let casosGenero = Genero.allCases

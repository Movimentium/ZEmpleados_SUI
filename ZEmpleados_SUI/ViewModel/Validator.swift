//  Validator.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 10/2/25.

import Foundation

struct Validator {
    static let shared = Validator()
    
    func isEmptyMsg(_ str: String) -> String {
        str.isEmpty ? "no puede estar vacío" : ""
    }
}

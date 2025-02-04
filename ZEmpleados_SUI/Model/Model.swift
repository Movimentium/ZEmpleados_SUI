//  Model.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 3/2/25.

import Foundation

struct Empleado: Identifiable, Hashable {
    let id: Int
    let firstName: String
    let lastName: String
    let username: String
    let email: String
    let address: String
    let zipcode: String
    let avatar: URL?
    let gender: Genero            // from Enums.swift
    let department: Departamento  // from Enums.swift
}

extension Empleado {
    var fullName: String {
        "\(lastName) \(firstName)"
    }
}

//  ModelDTO.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 3/2/25.

import Foundation

struct EmpleadoDTO: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let username: String
    let email: String
    let address: String
    let zipcode: String
    let avatar: URL?
    let gender: GeneroDTO
    let department: DepartamentoDTO
}

struct GeneroDTO: Codable {
    let id: Int
    let gender: Genero      // from Enums.swift
}

struct DepartamentoDTO: Codable {
    let id: Int
    let name: Departamento  // from Enums.swift
}


extension EmpleadoDTO {
    var toEmpleado: Empleado {
        Empleado(id: id,
                 firstName: firstName,
                 lastName: lastName,
                 username: username,
                 email: email,
                 address: address,
                 zipcode: zipcode,
                 avatar: avatar,
                 gender: gender.gender,
                 department: department.name)
    }
}

// e.g. usage:
// let empleadosDTO: [EmpleadoDTO] = []
// let empleados: [Empleado] = empleadosDTO.map(\.toEmpleado)  // from root keypath  // ZTip


//  EmpleadoEditVM.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 6/2/25.

import Foundation

final class EmpleadoEditVM: ObservableObject {
    let empleado: Empleado
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var username = ""
    @Published var email = ""
    @Published var address = ""
    @Published var zipcode = ""
    @Published var gender = ""
    @Published var department = ""

    init(empleado: Empleado) {
        self.empleado = empleado
        
        firstName = empleado.firstName
        lastName = empleado.lastName
        email = empleado.email
        address = empleado.address
        zipcode = empleado.zipcode
        username = empleado.username
        gender = empleado.gender.rawValue
        department = empleado.department.rawValue
    }
}

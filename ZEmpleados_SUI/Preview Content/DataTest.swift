//  DataTest.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 4/2/25.

import Foundation

extension Empleado {
    static let testInstance = Empleado(id: 1, firstName: "Miguel", lastName: "Gallego",
                                       username: "mgallego",
                                       email: "mgallego@example.com",
                                       address: "Madrid", zipcode: "28008",
                                       avatar: .urlImgMiguel,
                                       gender: .male, department: .engineering)
}

extension URL {
    static let urlImgMiguel = Bundle.main.url(forResource: "imgMiguel", withExtension: "jpg")
}

struct DataTestInteractor: DataInteractor {
    private let urlTestEmpleados = Bundle.main.url(forResource: "testEmpleados", withExtension: "json")!
    
    private func loadTestEmpleados() throws -> [Empleado] {
        let data = try Data(contentsOf: urlTestEmpleados)
        return try JSONDecoder().decode([EmpleadoDTO].self, from: data).map(\.toEmpleado)
    }
 
    func getEmpleados() async throws -> [Empleado] {
        try loadTestEmpleados()
    }
}

// ZTip: no me gusta demasiado
extension EmpleadosVM {
    static let test = EmpleadosVM(networkInteractor: DataTestInteractor())
}


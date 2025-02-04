//
//  DataTest.swift
//  ZEmpleados_SUI
//
//  Created by Miguel Gallego on 4/2/25.
//

import Foundation



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

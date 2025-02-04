//  NetworkInteractor.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 3/2/25.

import SwiftUI

protocol DataInteractor {
    func getEmpleados() async throws -> [Empleado]
}

struct NetworkInteractor: DataInteractor {
    
    func getJSON<JSON: Codable>(request: URLRequest, type: JSON.Type) async throws -> JSON {
        let (data, response) = try await URLSession.shared.getData(for: request)
        if response.statusCode == 200 {
            do {
                return try JSONDecoder().decode(type, from: data)
            } catch {
                throw NetworkError.json(error)
            }
        } else {
            throw NetworkError.status(response.statusCode)
        }
    }

    func postJSON(request: URLRequest, status: Int = 200) async throws {
        let (_, response) = try await URLSession.shared.getData(for: request)
        if response.statusCode != status {
            throw NetworkError.status(response.statusCode)
        }
    }

    // e.g. usage:
//    func putEmpleado() async throws {
//        let empleadosDTO: [EmpleadoDTO] = []
//        try await postJSON(request: .post(url: .empleado, data: empleadosDTO, method: "PUT"), status: 201)
//        // esperamos un statusCode == 201 tras la inserción
//    }
    
    func getEmpleados() async throws -> [Empleado] {
        try await getJSON(request: .get(url: .empleados), type: [EmpleadoDTO].self).map(\.toEmpleado)
    }
}


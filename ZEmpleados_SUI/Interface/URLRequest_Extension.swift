//  URLRequest_Extension.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 3/2/25.

import Foundation


extension URLRequest {
    static func get(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.timeoutInterval = 30  // by default are 600 secs (10min)
        request.httpMethod = "GET"    // by default is "GET"
        // Header fields
        request.setValue("application/json", forHTTPHeaderField: "Accept")  // al field que ya exista o no exista lo añade << (better)
        // request.addValue("application/json", forHTTPHeaderField: "Accept")  // lo añade
        return request
    }
    
    //
    static func post<JSON: Codable>(url: URL, data: JSON, method: String = "POST", encoder: JSONEncoder = JSONEncoder()) -> URLRequest {
        // method: Tb puede ser PUT, DELETE, ...
        // encoder: usado cuando hay valores que pueden ser fechas con una codificación determinada
        var request = URLRequest(url: url)
        request.timeoutInterval = 30
        request.httpMethod = method
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? encoder.encode(data)
        return request
    }
}

// e.g. usage:
// URLSession.shared.dataTask(with: .get(url: .empleados))
// URLSession.shared.dataTask(with: .post(url: .empleado, data: EmpleadoDTO(...))

//  URL_Extension.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 3/2/25.

// Aquí, TODAS las URLs de red que usaremos
import Foundation

let pro = URL(string: "https://acacademy-employees-api.herokuapp.com/api/")!
#if DEBUG
// Estas URLs NO estarán en el fichero compilado para el App Store
// (La carpeta Preview Content y su contenido tampoco estará en el compilado)
let des = URL(string: "http://localhost:8080/api")!
let pre = URL(string: "https://acacademy-stage.herokuapp.com/api")!
#endif

#if RELEASE
let api = pro
#else
let api = pro // Aquí, "des" o "pre" si lo hubiera
#endif

extension URL {
    static let empleados = api.appending(path: "getEmpleados")  // TODO: TEST
    static let empleado = api.appending(path: "empleado")  // PUT
    static func empleado(id: Int) -> URL {
        api.appending(path: "getEmpleado").appending(path: "\(id)")
    }
}

// TODO: TEST with id: 120
// URLSession.shared.dataTask(with: .empleado(id: 120))

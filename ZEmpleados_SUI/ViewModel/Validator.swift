//  Validator.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 10/2/25.

import Foundation

// Si devuelve "", la validación es OK
struct Validator {
    static let shared = Validator()
    
    func alwaysOK(_ str: String) -> String { "" }
    
    func isEmptyMsg(_ str: String) -> String {
        str.isEmpty ? "no puede estar vacío" : ""
    }
    
    func isValidEmailMsg(_ str: String) -> String {
        let errorMsg = "no es un email válido"
        let emailRegex = #"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])"#  // ZTip: uso de #" "# string en bruto
        do {
            let regex = try Regex(emailRegex)
            return try regex.wholeMatch(in: str) == nil ? errorMsg : ""
        } catch {
            return errorMsg  // Mejor: "Algo ha ido mal al validar el email"
        }
    }
    
    // Usa la validación isEmptyMsg(_:) y otra más // No me gusta esta mezcla...
    func isGreaterThan4chars(_ str: String) -> String {
        var errorMsg = isEmptyMsg(str)
        if str.count <= 4 {
            if !errorMsg.isEmpty { // "no puede estar vacío"
                errorMsg += " y "
            }
            errorMsg += "debe tener más de 4 caracteres"
        }
        return errorMsg
    }
    
}

//  EmpleadoEditVM.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 6/2/25.

import Foundation

final class EmpleadoEditVM: ObservableObject {
    let empleado: Empleado
    
    init(empleado: Empleado) {
        self.empleado = empleado
    }
}

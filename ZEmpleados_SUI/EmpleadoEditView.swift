//
//  EmpleadoEditView.swift
//  ZEmpleados_SUI
//
//  Created by Miguel Gallego on 6/2/25.
//

import SwiftUI

struct EmpleadoEditView: View {
    @ObservedObject var editVM: EmpleadoEditVM
    
    var body: some View {
        Text(editVM.empleado.fullName)
    }
}

#Preview {
    EmpleadoEditView(editVM: EmpleadoEditVM(empleado: .testInstance))
}

//  EmpleadoEditView.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 6/2/25.

import SwiftUI

struct EmpleadoEditView: View {
    @ObservedObject var editVM: EmpleadoEditVM
    
    var body: some View {
        Form {
            Section {
                MTextField(title: "Nombre", text: $editVM.firstName)
                MTextField(title: "Apellido", text: $editVM.lastName)
            } header: {
                Text("Datos personales")
            }
        }
        .navigationTitle("Editar empleado")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        EmpleadoEditView(editVM: EmpleadoEditVM(empleado: .testInstance))
    }
}

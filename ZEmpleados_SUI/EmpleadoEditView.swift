//  EmpleadoEditView.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 6/2/25.

import SwiftUI

struct EmpleadoEditView: View {
    @ObservedObject var editVM: EmpleadoEditVM
    private let valid = Validator.shared
    
    var body: some View {
        Form {
            Section {
                MTextField(title: "Nombre", text: $editVM.firstName)
                MTextField(title: "Apellido", text: $editVM.lastName)
                MTextField(title: "Dirección", text: $editVM.address)
                MTextField(title: "Código postal", text: $editVM.zipcode, validator: valid.alwaysOK)
                Picker("Género", selection: $editVM.gender) {
                    ForEach(Genero.allCases) { gender in
                        Text(gender.rawValue).tag(gender)
                    }
                }
            } header: {
                Text("Datos personales")
            }
            
            Section {
                Picker("Departamento", selection: $editVM.department) {
                    ForEach(Departamento.allCases) { dpto in
                        Text(dpto.rawValue).tag(dpto)
                    }
                }
                MTextField(title: "Email", text: $editVM.email, 
                           validator: valid.isValidEmailMsg)
                MTextField(title: "Nombre de usuario", text: $editVM.username, 
                           validator: valid.isGreaterThan4chars)
            } header: {
                Text("Detalles de la empresa")
            }
        }
        .navigationTitle("Editar empleado")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Guardar") {
                    
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EmpleadoEditView(editVM: EmpleadoEditVM(empleado: .testInstance))
    }
}

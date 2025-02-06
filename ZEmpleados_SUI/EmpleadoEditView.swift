//  EmpleadoEditView.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 6/2/25.

import SwiftUI

struct EmpleadoEditView: View {
    @ObservedObject var editVM: EmpleadoEditVM
    
    @State var isDataError = false
    
    var body: some View {
        Form {
            Section {
                VStack(alignment: .leading) {
                    Text("Nombre")
                        .font(.headline)
                    HStack {
                        TextField("Nombre", text: $editVM.firstName)
                        Button {
                            editVM.firstName = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                        }
                        .buttonStyle(.plain)
                        .opacity(editVM.firstName.isEmpty ? 0 : 0.5)
                    }
                    .padding(10)
                    .background {
                        Color(white: 0.95)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .fill(.red)
                            .opacity(isDataError ? 1 : 0)
                    }
                    Text("Nombre no puede estar vacío")
                        .font(.caption).bold().foregroundStyle(.red)
                        .opacity(isDataError ? 1 : 0)
                }
                .onChange(of: editVM.firstName) {
                    if editVM.firstName.isEmpty {
                        isDataError = true
                    } else {
                        isDataError = false
                    }
                }
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

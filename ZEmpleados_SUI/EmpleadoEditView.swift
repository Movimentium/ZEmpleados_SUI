//  EmpleadoEditView.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 6/2/25.

import SwiftUI

struct EmpleadoEditView: View {
    @ObservedObject var editVM: EmpleadoEditVM
    @FocusState private var enfocado: EmpleadoEditTextField? // ZTip 
    private let valid = Validator.shared
    
    var body: some View {
        Form {
            Section {
                MTextField(title: "Nombre", text: $editVM.firstName)
                    .textContentType(.name)
                    .textInputAutocapitalization(.words)
                    .focused($enfocado, equals: .firstName)
                MTextField(title: "Apellido", text: $editVM.lastName)
                    .textContentType(.familyName)
                    .textInputAutocapitalization(.words)
                    .focused($enfocado, equals: .lastName)
                MTextField(title: "Dirección", text: $editVM.address)
                    .textContentType(.fullStreetAddress)
                    .textInputAutocapitalization(.words)
                    .focused($enfocado, equals: .address)
                MTextField(title: "Código postal", text: $editVM.zipcode, validator: valid.alwaysOK)
                    .textContentType(.postalCode)
                    .autocorrectionDisabled()
                    .focused($enfocado, equals: .zipcode)
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
                MTextField(title: "Email", text: $editVM.email, validator: valid.isValidEmailMsg)
                    .textContentType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .focused($enfocado, equals: .email)

                MTextField(title: "Nombre de usuario", text: $editVM.username, validator: valid.isGreaterThan4chars)
                    .textContentType(.username)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .focused($enfocado, equals: .username)

            } header: {
                Text("Detalles de la empresa")
            }
        }
//        .submitLabel(.next)  // Alternativa a Keyboard ToolBarItems
//        .onSubmit {
//            enfocado?.next()  // Peeero hace un Hide/Show Keyboard cada vez ...
//        }
        .navigationTitle("Editar empleado")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Guardar") {
                    
                }
            }
            ToolbarItem(placement: .keyboard) {
                HStack {
                    Button {
                        enfocado = nil  // ZTip hide keyboard
                    } label: {
                        Image(systemName: "keyboard")
                    }
                    Spacer()
                    Button {
                        enfocado?.prev()
                    } label: {
                        Image(systemName: "chevron.up")
                    }
                    Button {
                        enfocado?.next()
                    } label: {
                        Image(systemName: "chevron.down")
                    }
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

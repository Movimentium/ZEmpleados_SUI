//  ContentView.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 3/2/25.

import SwiftUI

struct ContentView: View {
    // @ObservedObject var vm = EmpleadosVM()
    // Cambiamos esto por un @StateObject instanciado en ...App.swift
    // e inyectándolo como un objeto de entorno con .environmentObject()
    @EnvironmentObject var vm: EmpleadosVM
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Departamento.allCases) { dpto in
                    Section {
                        ForEach(vm.getEmpleados(porDpto: dpto)) { empleado in
                            EmpleadoCellView(empleado: empleado, onDelete: vm.showAlertDelete)
                        }
                    } header: {
                        Text(dpto.rawValue)
                    }
                }
            }
            .navigationTitle("Empleados")
            .searchable(text: $vm.strSearch, prompt: "Buscar empleado")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu("Ordenar") {
                        ForEach(SortType.allCases) { sortType in
                            Button(sortType.rawValue) {
                                vm.sortType = sortType
                            }
                        }
                    }
                }
            }
        }
        .alert("Error", isPresented: $vm.showErrorAlert) { } message: {
            Text(vm.alertMsg)
            /* en URL_Extension, cambia en el str path a "getEmp" pe
             para probar esta alert. O, pe, cambia en EmpleadoDTO firstmememe
            */
        }
        .alert("Borrado", isPresented: $vm.showDeleteAlert) {
            Button("Borrar", role: .destructive) {
                withAnimation {
                    vm.deleteEmpleado()
                }
            }
            Button("Cancelar", role: .cancel) { }
        } message: {
            Text(vm.alertMsg)
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(EmpleadosVM(networkInteractor: DataTestInteractor()))
        // .environmentObject(EmpleadosVM.test)  // ZTip: pero no me gusta.
        // más claro la 1º línea
}

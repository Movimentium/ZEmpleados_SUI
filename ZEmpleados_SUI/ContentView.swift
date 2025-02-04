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
                            EmpleadoCellView(empleado: empleado)
                        }
                    } header: {
                        Text(dpto.rawValue)
                    }
                }
            }
            .navigationTitle("Empleados")
        }
        .alert("Error", isPresented: $vm.showErrorAlert) {
            /* en URL_Extension, cambia en el str path a "getEmp" pe
             para probar esta alert. O, pe, cambia en EmpleadoDTO firstmememe
            */
            Text(vm.errorMsg)
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(EmpleadosVM(networkInteractor: DataTestInteractor()))
        // .environmentObject(EmpleadosVM.test)  // ZTip: pero no me gusta.
        // más claro la 1º línea
}

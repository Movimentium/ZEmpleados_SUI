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
            List(vm.empleados) { empleado in
                EmpleadoCellView(empleado: empleado)
            }
            .navigationTitle("Empleados")
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(EmpleadosVM(networkInteractor: DataTestInteractor()))
        // .environmentObject(EmpleadosVM.test)  // ZTip: pero no me gusta.
        // más claro la 1º línea
}

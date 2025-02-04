//  ContentView.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 3/2/25.

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = EmpleadosVM()
    
    var body: some View {
        List(vm.empleados) { empleado in
            let strEmpleado = empleado.firstName + " " + empleado.lastName
            Text(strEmpleado)
        }
    }
}

#Preview {
    ContentView(vm: EmpleadosVM(networkInteractor: DataTestInteractor()))
}

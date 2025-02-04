//  ZEmpleados_SUIApp.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 3/2/25.

import SwiftUI
/*
 Buscar: ZTip
 
 */

@main
struct ZEmpleados_SUIApp: App {
    @StateObject var vm = EmpleadosVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}

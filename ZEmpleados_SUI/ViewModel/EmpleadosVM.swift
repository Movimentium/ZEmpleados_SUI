//  EmpleadosVM.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 3/2/25.

import Foundation

final class EmpleadosVM: ObservableObject {
    let networkInteractor: DataInteractor
    
    @Published var empleados: [Empleado] = []
    @Published var showErrorAlert = false
    var errorMsg = ""
    @Published var sortType = SortType.ascendent
    @Published var strSearch = ""
    
    init(networkInteractor: DataInteractor = NetworkInteractor()) {
        self.networkInteractor = networkInteractor
        Task { await getEmpleados() }
    }
    
    // @MainActor // 1. JAMÁS hacer esto ya que paramos el hilo principal con el await,
    // y queremos que se recupere desde un hilo en segundo plano y luego elevarlo al hilo ppal.
    func getEmpleados() async { // Aquí gestionaremos los errores recibidos
        do {
            let emps = try await networkInteractor.getEmpleados()  // Sin @MainActor: se ejecuta en hilo secundario
            // 2. Hacer esto, en lugar de escribir @MainActor (que hace que toda la func se ejecute en el main thread)
            // emps es un valor enviable (Sendable)
            await MainActor.run {
                self.empleados = emps
            }
        } catch {
            print(error) // ZTip: recuerda que \(error.localizedDescription) da MUY poca info
            await MainActor.run {
                self.errorMsg = "\(error)"
                self.showErrorAlert = true
            }
        }
    }
    
    func getEmpleados(porDpto dpto: Departamento) -> [Empleado] {
        empleados
            .filter { $0.department == dpto }  // filtro por dpto
            .filter {                          // filtro de búsqueda
                if strSearch.isEmpty { return true } // se devuelven todos los elems
                return $0.fullName.localizedCaseInsensitiveContains(strSearch)
            }
            .sorted {
                switch sortType {
                case .ascendent:   $0.fullName <= $1.fullName
                case .descendent:  $0.fullName >= $1.fullName
                case .byID:        $0.id <= $1.id
                }
            }
    }
}


// ZTip: En el esquema: Run (debug) > Diagnostics > Runtime API Checking > [X] Main Thread Checher
// Evita que la app se cuelgue en modo Debug

// [ ] Zombie Objects: para detectar zombies (objs que no se liberan de mem convirtiéndose en NSZombie)

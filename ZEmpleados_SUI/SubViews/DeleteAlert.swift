//  DeleteAlert.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 6/2/25.

import SwiftUI

struct DeleteAlert: ViewModifier {
    @Binding var show: Bool
    let msg: String
    let onDelete: () -> Void

    func body(content: Content) -> some View {
        content
            .alert("Borrado", isPresented: $show) {
                Button("Borrar", role: .destructive) {
                    withAnimation {
                        onDelete()
                    }
                }
                Button("Cancelar", role: .cancel) { }
            } message: {
                Text(msg)
            }
    }
}

extension View {
    func deleteAlert(show: Binding<Bool>, msg: String, onDelete: @escaping () -> Void) -> some View {
        modifier(DeleteAlert(show: show, msg: msg, onDelete: onDelete))
    }
}

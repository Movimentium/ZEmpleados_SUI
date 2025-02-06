//  EmpleadoCellView.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 4/2/25.

import SwiftUI

struct EmpleadoCellView: View {
    let empleado: Empleado
    let onDelete: (Empleado) -> Void  // ZTip
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(empleado.fullName)
                    .font(.headline)
                Text(empleado.email)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            AsyncImage(url: empleado.avatar) { image in
                image
                    .resizable()
                    .scaledToFit()

            } placeholder: {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 70, height: 70)
            .background(.white.opacity(0.9))
            .clipShape(Circle())
            .overlay(Circle().stroke(.white, lineWidth: 3))
            .shadow(radius: 3)
            .padding(.vertical, 6)
        }
        .swipeActions {
            Button {
                onDelete(empleado)  // ZTip
            } label: {
                Label("Borrar", systemImage: "trash")
            }
            .tint(.red)
        }
    }
}

#Preview {
    EmpleadoCellView(empleado: .testInstance,
                     onDelete: { _ in })   // ZTip
}

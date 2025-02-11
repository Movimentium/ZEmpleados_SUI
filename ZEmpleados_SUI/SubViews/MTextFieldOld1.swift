//  MTextFieldOld1.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 10/2/25.

import SwiftUI

struct MTextFieldOld1: View {
    let title: String
    @Binding var text: String
    @State private var isDataError = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title.capitalized)
                .font(.headline)
            HStack {
                TextField(title.capitalized, text: $text)
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                }
                .buttonStyle(.plain)
                .opacity(text.isEmpty ? 0 : 0.5)
            }
            .padding(10)
            .background {
                Color(white: 0.95)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2).fill(.red)
                    .opacity(isDataError ? 1 : 0)
            }
            if isDataError {
                Text("\(title.capitalized) no puede estar vacío")
                    .font(.caption).bold().foregroundStyle(.red)
                    .transition(.opacity)
                    // .opacity(isDataError ? 1 : 0) // Alternativa sin "if isDataError"
            }
        }
        .onChange(of: text) {
            if text.isEmpty {
                isDataError = true
            } else {
                isDataError = false
            }
        }
        .animation(.default, value: isDataError)

    }
}

fileprivate struct Preview_MTextField: View {
    @State var txt = "Miguel"
    
    var body: some View {
        MTextFieldOld1(title: "Nombre", text: $txt)
            .border(.red)
            .padding()
    }
}

#Preview {
    Preview_MTextField()
}

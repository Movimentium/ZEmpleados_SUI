//  MTextFieldV2.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 10/2/25.

import SwiftUI

struct MTextFieldV2: View {
    let title: String
    @Binding var text: String
    var validator: (String) -> String = Validator.shared.isEmptyMsg
    @State private var errorMsg: String = ""
    
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
                    .stroke(lineWidth: 2)
                    .fill(.red)
                    .opacity(errorMsg.isEmpty ? 0 : 1)
            }
            if !errorMsg.isEmpty {
                Text("\(title.capitalized) \(errorMsg)")
                    .font(.caption).bold().foregroundStyle(.red)
                    .transition(.opacity)
                    // .opacity(isDataError ? 1 : 0) // Alternativa sin "if isDataError"
            }
        }
        .onChange(of: text) {
            errorMsg = validator(text)
        }
        .animation(.default, value: errorMsg)

    }
}

fileprivate struct Preview_MTextFieldV2: View {
    @State var txt = "Miguel"
    
    var body: some View {
        MTextFieldV2(title: "Nombre", text: $txt)
            .padding()
            .border(.red)
    }
}

#Preview {
    Preview_MTextFieldV2()
}

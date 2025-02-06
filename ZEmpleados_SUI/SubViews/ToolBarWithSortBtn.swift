//  ToolBarWithSortBtn.swift
//  ZEmpleados_SUI
//  Created by Miguel Gallego on 6/2/25.

import SwiftUI

struct ToolBarWithSortBtn: ViewModifier {
    @Binding var sortValue: SortType
    
    func body(content: Content) -> some View {
        content
            .toolbar  {
                ToolbarItem(placement: .topBarLeading) {
                    Menu("Ordenar") {
                        ForEach(SortType.allCases) { aSortType in
                            Button(aSortType.rawValue) {
                                sortValue = aSortType
                            }
                        }
                    }
                }
            }
    }
}

extension View {
    func toolBarWithSortBtn(sortValue: Binding<SortType>) -> some View {
        modifier(ToolBarWithSortBtn(sortValue: sortValue))
    }
}

//
//  DismissToolbarItem.swift
//  SynergyTradeCenter
//
//  Created by Edward Downhill on 07/09/2023.
//

import SwiftUI

struct CustomizableDismissToolbarViewModifier<ToolbarContentType: ToolbarContent>: ViewModifier {
    
    @Binding var isPresented: Bool
    @ToolbarContentBuilder let toolbarContent: ToolbarContentType
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isPresented = false
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.theme.textSeconary)
                    }
                }
                toolbarContent
            }
    }
}

struct DismissToolbarViewModifier: ViewModifier {
    
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isPresented = false
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.theme.textSeconary)
                    }
                }
            }
    }
}

extension View {
    
    func customToolbar(isPresented: Binding<Bool>, @ToolbarContentBuilder content: @escaping () -> some ToolbarContent) -> some View {
        modifier(CustomizableDismissToolbarViewModifier(isPresented: isPresented, toolbarContent: content))
    }
    
    func customToolbar(isPresented: Binding<Bool>) -> some View {
        modifier(DismissToolbarViewModifier(isPresented: isPresented))
    }
}

struct DismissToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                
            }
            .customToolbar(isPresented: .constant(true), content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.theme.textSeconary)
                    }
                }
            })
        }
    }
}

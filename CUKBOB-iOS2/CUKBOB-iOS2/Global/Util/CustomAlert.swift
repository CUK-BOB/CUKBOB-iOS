//
//  CustomAlert.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/12/26.
//

import SwiftUI
import Combine

// MARK: - AlertManager

class AlertManager: ObservableObject {

    @Published var isPresented: Bool = false
    @Published var alertType: AlertType?
    @Published var onCancel: (() -> Void)? = nil
    @Published var onConfirm: (() -> Void)? = nil

    func show(
        alertType: AlertType,
        onCancel: (() -> Void)? = nil,
        onConfirm: (() -> Void)? = nil
    ) {
        self.alertType = alertType
        self.onCancel = {
            onCancel?()
            self.dismiss()
        }
        
        self.onConfirm = {
            onConfirm?()
            self.dismiss()
        }
        
        self.isPresented = true
    }
    
    private func dismiss() {
        self.isPresented = false
        self.alertType = nil
        self.onCancel = nil
        self.onConfirm = nil
    }
}

// MARK: - AlertModifier

struct AlertModifier: ViewModifier {
    
    @ObservedObject var alertManager: AlertManager
    
    func body(content: Content) -> some View {
        content
            .alert(
                alertManager.alertType?.title ?? "",
                isPresented: $alertManager.isPresented
            ) {
                
                Button(alertManager.alertType?.cancelText ?? "", role: .cancel) {
                    alertManager.onCancel?()
                }
                
                Button(alertManager.alertType?.confirmText ?? "") {
                    alertManager.onConfirm?()
                }
                
            } message: {
                Text(alertManager.alertType?.message ?? "")
            }
    }
}

extension View {
    func customAlert(alertManager: AlertManager) -> some View {
        self.modifier(AlertModifier(alertManager: alertManager))
    }
}

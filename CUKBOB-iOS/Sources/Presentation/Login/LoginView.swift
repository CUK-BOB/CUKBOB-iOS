//
//  SignupView.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        Button {
            navigationManager.navigate(to: .nickName)
        } label: {
            Text("Login View")
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(NavigationManager())
}

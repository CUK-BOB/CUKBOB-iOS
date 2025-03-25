//
//  HomeView.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        VStack {
            Button {
                navigationManager.presentFullScreenModal(.login)
            } label: {
                Text("FullScreenModal")
            }
            
            Button {
                navigationManager.navigate(to: .temp)
            } label: {
                Text("navigate")
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(NavigationManager())
}

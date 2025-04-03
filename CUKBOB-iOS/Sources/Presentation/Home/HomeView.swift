//
//  HomeView.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Property
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    // MARK: - body
    
    var body: some View {
        ZStack {
            Color(.blue100)
                .ignoresSafeArea()
                .onTapGesture {
                    hideKeyboard()
                }
            
            ScrollView(.vertical) {
                VStack(spacing: Screen.height(0)) {
                    guiSection
                    
                    homeMealSection
                }
            }
            .clipped()
        }
        .navigationBarBackButtonHidden()
    }
}

// MARK: - Subview

private extension HomeView {
    var guiSection: some View {
        Image(.tempGUI)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity)
            .frame(height: Screen.width(120))
            .clipped()
            
    }
    
    var timeSelectSection: some View {
        HStack(spacing: 20) {
            HomeMealTimeButton(mealTime: .morning) {
                print("조식")
            }
            
            HomeMealTimeButton(mealTime: .lunch) {
                print("중식")
            }
            
            HomeMealTimeButton(mealTime: .dinner) {
                print("석식")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, Screen.height(20))
        .background(Color(.blue100))
    }
    
    var homeMealSection: some View {
        LazyVStack(alignment: .center, spacing: Screen.height(0), pinnedViews: [.sectionHeaders]) {
            Section(header: timeSelectSection) {
                HomeMealCell(restaurant: .cafeBona)
                HomeMealCell(restaurant: .buonpranzoNoodle)
                HomeMealCell(restaurant: .buonpranzoRice)
            }
        }
        .padding(.horizontal, Screen.width(24))
    }
}

#Preview {
    HomeView()
        .environmentObject(NavigationManager())
}

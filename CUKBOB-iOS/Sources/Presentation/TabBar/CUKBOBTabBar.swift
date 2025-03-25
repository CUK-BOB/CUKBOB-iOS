//
//  CustomTabBar.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

struct CUKBOBTabBar: View {
    
    @Binding var selectedTab: TabBarState
    
    var body: some View {
        HStack(spacing: 0) {
            tabItem(tab: .home, selectedTab: $selectedTab)
            Spacer()
            tabItem(tab: .weeklyMenu, selectedTab: $selectedTab)
            Spacer()
            tabItem(tab: .foodAndBeverage, selectedTab: $selectedTab)
            Spacer()
            tabItem(tab: .myPage, selectedTab: $selectedTab)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .padding(.bottom, 16)
        .background(Color(.blue100))
    }
    
    func tabItem(tab: TabBarState, selectedTab: Binding<TabBarState>) -> some View {
        Button {
            self.selectedTab = tab
        } label: {
            VStack(spacing: Screen.height(8)) {
                Image(self.selectedTab == tab ? tab.selectedImage : tab.defaultImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Screen.width(24), height: Screen.height(24))
                
                CUKBOBText(
                    tab.title,
                    fontType: self.selectedTab == tab ? .label01 : .label01,
                    color: self.selectedTab == tab ? Color(.blue700) : Color(.blue300)
                )
            }
            .frame(width: Screen.width(82), height: Screen.height(46))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    @Previewable @StateObject var navigationManager = NavigationManager()
    TabBarView()
        .environmentObject(navigationManager)
}

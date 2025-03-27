//
//  NickNameCompleteView.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/27/25.
//

import SwiftUI

struct NickNameCompleteView: View {
    
    // MARK: - Property
    
    @EnvironmentObject var navigationManager: NavigationManager
    private let nickName: String
    
    // MARK: - Initializer
    
    init(nickName: String) {
        self.nickName = nickName
    }
    
    // MARK: - body
    
    var body: some View {
        ZStack {
            Color(.blue0)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                titleSection
                
                guiSection
                
                Spacer()
                
                confirmButtonSection
            }
        }
        .navigationBarBackButtonHidden()
    }
}

// MARK: - subviews

private extension NickNameCompleteView {
    var titleSection: some View {
        VStack(alignment: .center, spacing: 4) {
            CUKBOBText("\(nickName)님!", fontType: .title03, color: Color(.blue500))
            
            CUKBOBText("학식 확인하러 가볼까요?", fontType: .heading02, color: Color(.blue300))
        }
        .padding(.top, Screen.height(148))
        .padding(.bottom, Screen.height(52))
    }
    
    var guiSection: some View {
        Image(.tempGUI)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: Screen.width(321), height: Screen.height(387))
    }
    
    var confirmButtonSection: some View {
        CUKBOBButton(isEnabled: .constant(true), title: "확인") {
            /*
             Todo: 탭바로 돌아가기(dismiss
             */
            navigationManager.rootView = .tabBar
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 32)
    }
}

#Preview {
    NickNameCompleteView(nickName: "승원")
        .environmentObject(NickNameViewModel())
}

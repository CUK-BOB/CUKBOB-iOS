//
//  CustomNavigationBarModifier.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/9/26.
//

import SwiftUI

struct CustomNavigationBarModifier<C, L, R>: ViewModifier where C: View, L: View, R: View {
    
    // MARK: - Properties
    
    let centerView: (() -> C)?
    let leftView: (() -> L)?
    let rightView: (() -> R)?
    let backgroundColor: Color
    
    // MARK: - Initializer
    
    init(
        centerView: (() -> C)? = nil,
        leftView: (() -> L)? = nil,
        rightView: (() -> R)? = nil,
        backgroundColor: Color
    ) {
        self.centerView = centerView
        self.leftView = leftView
        self.rightView = rightView
        self.backgroundColor = backgroundColor
    }
    
    // MARK: - Body
    
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            ZStack(alignment: .center) {
                HStack(spacing: 0) {
                    self.leftView?()
                    
                    Spacer()
                    
                    self.rightView?()
                }
                
                self.centerView?()
                
            }
            .padding(.horizontal, 20.adjustedWidth)
            .padding(.vertical, 16.adjustedHeight)
            .frame(width: 375.adjustedWidth)
            
            content
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

extension View {
    @ViewBuilder
    func customNavigationBar(_ navigationBarType: NavigationBarType) -> some View  {
        switch navigationBarType {
            
        // MARK: - 주간 학식
            
        case .weeklyMenu(let myPageAction):
            self.modifier(
                CustomNavigationBarModifier(
                    centerView: {
                        EmptyView()
                    },
                    leftView: {
                        Image(.logo1)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 98.adjusted, height: 24.adjusted)
                            .padding(.leading, 12.adjustedWidth)
                    },
                    rightView: {
                        Button {
                            myPageAction()
                        } label: {
                            Image(.iconBottom)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24.adjusted, height: 24.adjusted)
                        }
                        .buttonStyle(.plain)
                        .padding(.trailing, 12.adjustedWidth)
                    },
                    backgroundColor: .gray100
                )
            )
            
        // MARK: - 마이 페이지
            
        case .myPage(let backAction):
            self.modifier(
                CustomNavigationBarModifier(
                    centerView: {
                        Text("마이페이지")
                            .applyCBFont(.subtitle01)
                            .foregroundStyle(.gray600)
                    },
                    leftView: {
                        Button {
                            backAction()
                        } label: {
                            Image(.arrowLeft)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24.adjusted, height: 24.adjusted)
                        }
                        .buttonStyle(.plain)
                    },
                    rightView: {
                        EmptyView()
                    },
                    backgroundColor: .gray100
                )
            )
        }
    }
}

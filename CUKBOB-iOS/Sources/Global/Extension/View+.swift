//
//  View+.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/27/25.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared
            .sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func onDidAppear(perform: @escaping () -> Void) -> some View {
        background(ViewDidAppearModifier(onDidAppear: perform))
            .ignoresSafeArea(edges: .bottom)
            .background(Color(.blue100))
    }
}

// MARK: - Custom NavigationBar

extension View {
    @ViewBuilder
    func customNavigationBar(_ navigationBarType: NavigationBarType) -> some View {
        switch navigationBarType {
        case .seeReview(let backAction):
            self.modifier(
                CustomNavigationBarModifier(
                    centerView: {
                        CUKBOBText("리뷰", fontType: .heading02, color: Color(.blue700))
                    },
                    leftView: {
                        Button {
                            backAction()
                        } label: {
                            Image(.arrowLeft)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: Screen.width(18), height: Screen.height(18))
                        }
                    },
                    rightView: {
                        EmptyView()
                    },
                    backgroundColor: Color(.blue100)
                )
            )
        case .writeReview(let backAction):
            self.modifier(
                CustomNavigationBarModifier(
                    centerView: {
                        CUKBOBText("리뷰 작성", fontType: .heading02, color: Color(.blue700))
                    },
                    leftView: {
                        Button {
                            backAction()
                        } label: {
                            Image(.arrowLeft)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: Screen.width(18), height: Screen.height(18))
                        }
                    },
                    rightView: {
                        EmptyView()
                    },
                    backgroundColor: Color(.blue100)
                )
            )
        case .foodAndBeverageDetail(let backAction):
            self.modifier(
                CustomNavigationBarModifier(
                    centerView: {
                        EmptyView()
                    },
                    leftView: {
                        Button {
                            backAction()
                        } label: {
                            Image(.arrowLeft)
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: Screen.width(24), height: Screen.height(24))
                                .foregroundStyle(Color(.gray0))
                        }
                    },
                    rightView: {
                        EmptyView()
                    }
                )
            )
        }
    }
}

enum NavigationBarType {
    case seeReview(backAction: () -> Void)
    case writeReview(backAction: () -> Void)
    case foodAndBeverageDetail(backAction: () -> Void)
}

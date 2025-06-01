//
//  FlowTextView.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 6/2/25.
//

import SwiftUI

struct FlowTextView: View {
    
    // MARK: - Properties
    
    @State private var totalHeight: CGFloat = .zero
    
    let items: [String]
    
    let fontType: CUKBOBFont
    let textColor: Color
    
    let horizontalSpacing: CGFloat
    let verticalSpacing: CGFloat
    
    // MARK: - body
    
    var body: some View {
        GeometryReader { geometry in
            var width: CGFloat = .zero
            var height: CGFloat = .zero
            
            ZStack(alignment: .topLeading) {
                ForEach(items, id: \.self) { item in
                    CUKBOBText(item, fontType: fontType, color: textColor)
                        .alignmentGuide(.leading) { view in
                            if (abs(width - view.width) > geometry.size.width) {
                                width = 0.0
                                height -= view.height
                                height -= verticalSpacing
                            }
                            
                            let result = width
                            
                            if item == items.last {
                                width = 0
                            } else {
                                width -= view.width
                                width -= horizontalSpacing
                            }
                            
                            return result
                        }
                        .alignmentGuide(.top) { _ in
                            let result = height
                            
                            if item == items.last {
                                height = 0
                            }
                            
                            return result
                        }
                }
            }
            .background(
                GeometryReader { geomety in
                    Color.clear
                        .onAppear {
                            self.totalHeight = geomety.size.height
                        }
                }
            )
        }
        .frame(height: totalHeight)
    }
}

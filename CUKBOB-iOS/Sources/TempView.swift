//
//  TempView.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

struct TempView: View {
    let items = [
            "aaaaaa",
            "bbb",
            "ccccccccccc",
            "ddddddddd",
            "eeeee"
        ]
        
        var body: some View {
            ScrollView {
                // 1개의 열로 구성된 LazyVGrid
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: 100)) // 각 셀의 최소 너비
                ], spacing: 10) {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                            .padding()
                            .frame(width: dynamicWidth(for: item), height: 50) // 동적으로 가로 길이 설정
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                            .fixedSize(horizontal: true, vertical: false) // 텍스트 길이에 맞춰 가로 크기 고정
                    }
                }
                .padding()
            }
        }
        
        // 텍스트의 길이에 따라 동적으로 가로 길이를 계산하는 함수
        func dynamicWidth(for item: String) -> CGFloat {
            let baseWidth: CGFloat = 100  // 최소 너비
            let extraWidth = CGFloat(item.count) * 8  // 텍스트 길이에 따라 너비 추가
            return baseWidth + extraWidth
        }
    }


#Preview {
    TempView()
}

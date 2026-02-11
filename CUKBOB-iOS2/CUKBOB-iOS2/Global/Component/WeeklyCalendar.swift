//
//  WeeklyCalendar.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/9/26.
//

import SwiftUI

struct WeeklyCalendar: View {
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .frame(height: 90.adjustedHeight)
                .foregroundStyle(.gray100)
                .cornerRadius(24, corners: [.bottomLeft, .bottomRight])
                .shadow(color: .black.opacity(0.07), radius: 2, x: 0, y: 5)
            
            horizontalCalendar
                .padding(.top, 12.adjustedHeight)
        }
    }
}

// MARK: - Subviews

extension WeeklyCalendar {
    private var weekDayButton: some View {
        VStack(alignment: .center, spacing: 4.adjustedHeight) {
            Text("일")
                .applyCBFont(.subtitle02)
                .foregroundStyle(.gray400)
            
            Text("30")
                .applyCBFont(.subtitle02)
                .foregroundStyle(.gray400)
        }
        .frame(width: 22.adjustedWidth, height: 52.adjustedHeight)
    }
    
    private var horizontalCalendar: some View {
        HStack(alignment: .center, spacing: 26.adjustedWidth) {
            ForEach(0..<7) { _ in
                weekDayButton
            }
        }
    }
}

#Preview {
    WeeklyCalendar()
}

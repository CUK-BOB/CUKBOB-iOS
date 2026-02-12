//
//  TextField+.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/12/26.
//

import SwiftUI

extension TextField {
    func configureDefaultTextField() -> some View {
        self
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
    }
}

//
//  CBTextField.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/12/26.
//

import SwiftUI

struct CBTextField: View {
    
    // MARK: - Properties
    
    @State private var text: String
    
    private var placeholder: String
    private var textFieldDescriptiontype: TextFieldDescriptionType
    private var onChange: ((String) -> Void)?
    private var onSubmit: ((String) -> Void)?
    
    private let maxLength: Int = 10
    
    // MARK: - Initializer
    
    init(
        text: String = "",
        placeholder: String,
        textFieldDescriptiontype: TextFieldDescriptionType = .none,
        onChange: ((String) -> Void)? = nil,
        onSubmit: ((String) -> Void)? = nil
    ) {
        self.text = text
        self.placeholder = placeholder
        self.textFieldDescriptiontype = textFieldDescriptiontype
        self.onChange = onChange
        self.onSubmit = onSubmit
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.adjustedHeight) {
            textField
            
            description
        }
    }
}

// MARK: - Subviews

extension CBTextField {
    private var textField: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .applyCBFont(.body01)
                    .foregroundColor(.gray400)
            }
            
            TextField("", text: $text)
                .configureDefaultTextField()
                .applyCBFont(.body01)
                .foregroundStyle(.gray600)
                .onChange(of: text) { _, newValue in
                    if newValue.count > maxLength {
                        text = String(newValue.prefix(maxLength))
                        onChange?(text)
                    } else {
                        onChange?(text)
                    }
                }
                .onSubmit {
                    onSubmit?(text)
                }
                
        }
        .frame(height: 24.adjustedHeight)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12.adjustedHeight)
        .padding(.horizontal, 12.adjustedWidth)
        .addBorder(.roundedRectangle(cornerRadius: 12), borderColor: .blue100, borderWidth: 1)
    }
    
    private var description: some View {
        Text(textFieldDescriptiontype.description)
            .applyCBFont(.body02)
            .foregroundStyle(textFieldDescriptiontype.color)
    }
}

#Preview {
    CBTextField(
        text: "",
        placeholder: "닉네임 입력",
        textFieldDescriptiontype: .duplicated
    )
}

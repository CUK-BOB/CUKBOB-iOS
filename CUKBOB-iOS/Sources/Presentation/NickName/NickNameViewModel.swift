//
//  NickNameViewModel.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/27/25.
//

import Foundation

final class NickNameViewModel: ObservableObject {
    
    @Published var nickName: String = ""
    @Published var nickNameState: NickNameState = .count
    @Published var isNickNameButtonEnabled: Bool = false
    @Published var isConfirmButtonEnabled: Bool = false
    
    var getNickName: String {
        return "승원"
    }
    
}

extension NickNameViewModel {
    
}

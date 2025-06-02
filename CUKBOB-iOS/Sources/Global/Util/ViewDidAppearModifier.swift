//
//  ViewDidAppearModifier.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 6/2/25.
//

import SwiftUI

struct ViewDidAppearModifier: UIViewControllerRepresentable {
    let onDidAppear: () -> Void

    func makeUIViewController(context: Context) -> UIViewController {
        ViewDidAppearController(onDidAppear: onDidAppear)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }

    private class ViewDidAppearController: UIViewController {
        let onDidAppear: () -> Void

        init(onDidAppear: @escaping () -> Void) {
            self.onDidAppear = onDidAppear
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            onDidAppear()
        }
    }
}

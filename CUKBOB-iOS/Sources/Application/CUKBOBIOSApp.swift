import SwiftUI

@main
struct CUKBOBIOSApp: App {
    @StateObject private var navigationManager = NavigationManager()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(navigationManager)
        }
    }
}

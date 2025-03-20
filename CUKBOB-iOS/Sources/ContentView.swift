import SwiftUI

public struct ContentView: View {
    public init() {}

    public var body: some View {
        VStack {
            CUKBOBText("테스트", fontType: .display01, color: Color(.error))
            Text("테스트")
                .applyCUKBOBFont(.display01)
                .foregroundStyle(Color((.success)))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

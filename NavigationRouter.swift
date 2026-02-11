import SwiftUI
internal import Combine

final class NavigationRouter: ObservableObject {
    @Published var navigationID = UUID()

    func resetToRoot() {
        navigationID = UUID()
    }
}

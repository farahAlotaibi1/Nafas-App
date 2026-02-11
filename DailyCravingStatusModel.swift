import Foundation
import SwiftUI
internal import Combine

enum CravingStatus: String, Codable {
    case success
    case failure
}

final class DailyCravingStatusModel: ObservableObject {
    // Store statuses keyed by a day-only Date (midnight)
    @Published private(set) var statuses: [Date: CravingStatus] = [:]

    private let calendar = Calendar.current

    // Normalize any date to midnight for day granularity
    private func startOfDay(_ date: Date) -> Date {
        calendar.startOfDay(for: date)
    }

    func setStatus(for date: Date = Date(), status: CravingStatus) {
        let key = startOfDay(date)
        statuses[key] = status
    }

    func status(for date: Date) -> CravingStatus? {
        let key = startOfDay(date)
        return statuses[key]
    }
}


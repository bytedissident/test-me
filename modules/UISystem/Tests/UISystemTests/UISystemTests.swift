import XCTest
import SnapshotTesting
@testable import UISystem

final class UISystemTests: XCTestCase {
    func testView() {
        let sut = ContentView()
        assertSnapshot(matching: sut, as: .image, record: false)
    }
}

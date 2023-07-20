//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import Combine
import UIKit

extension Main {
    final class VM {
        @Published var state = Main.Models.State.none
    }
}

// MARK: - Do Action

extension Main.VM {
    func doAction(_ action: Main.Models.Action) {
        switch action {
        }
    }
}

// MARK: - Handle Action

private extension Main.VM {}

// MARK: - Response Action

private extension Main.VM {}

// MARK: - Convert Something

private extension Main.VM {}

//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import Combine
import UIKit

extension DropMenu {
    final class VM {
        @Published var state = DropMenu.Models.State.none
    }
}

// MARK: - Do Action

extension DropMenu.VM {
    func doAction(_ action: DropMenu.Models.Action) {
        switch action {
        }
    }
}

// MARK: - Handle Action

private extension DropMenu.VM {}

// MARK: - Response Action

private extension DropMenu.VM {}

// MARK: - Convert Something

private extension DropMenu.VM {}

//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import UIKit

protocol DropMenuDelegate: AnyObject {
    func dropMenu(menu: DropMenu.VC, selected option: DropMenu.Models.DisplayOption)
    func dropMenuHeight() -> CGFloat?
    func dropMenuShowOnRect() -> CGRect
}

extension DropMenu {
    enum Models {}
}

// MARK: - Action

extension DropMenu.Models {
    enum Action {}
}

// MARK: - State

extension DropMenu.Models {
    enum State {
        case none
    }
}

// MARK: - Display Model

extension DropMenu.Models {
    struct DisplayOption: Hashable {
        let uid = UUID().uuidString
        let title: String
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(uid)
        }
    }
}

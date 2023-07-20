//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import UIKit

extension Main {
    final class Router {
        weak var vc: Main.VC?
    }
}

// MARK: - Route to

extension Main.Router {
    func showDropMenu(on button: UIButton) {
        if let vc = vc {
            let menu = DropMenu.VC()
            menu.onButton = button
            menu.delegate = vc
            menu.showIn(vc)
        }
    }
}

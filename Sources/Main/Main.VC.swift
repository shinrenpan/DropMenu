//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import Combine
import UIKit

extension Main {
    final class VC: UIViewController {
        var vo = Main.VO()
        var vm = Main.VM()
        var router = Main.Router()
        var binding = Set<AnyCancellable>()
        
        override func loadView() {
            self.view = vo.mainView
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupSelf()
            setupBinding()
            setupVO()
        }
    }
}

// MARK: - DropMenuDelegate

extension Main.VC: DropMenuDelegate {
    func dropMenu(menu: DropMenu.VC, selected option: DropMenu.Models.DisplayOption) {
        menu.dismiss(animated: false) {
            self.vo.button.setTitle(option.title, for: .normal)
        }
    }
    
    func dropMenuHeight() -> CGFloat? {
        nil
    }
    
    func dropMenuShowOnRect() -> CGRect {
        vo.button.convert(vo.button.bounds, to: vo.button.window)
    }
}

// MARK: - Setup Something

private extension Main.VC {
    func setupSelf() {
        router.vc = self
    }
    
    func setupBinding() {
        vm.$state.receive(on: DispatchQueue.main).sink { [weak self] state in
            switch state {
            case .none:
                self?.stateNone()
            }
        }.store(in: &binding)
    }
    
    func setupVO() {
        vo.button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
}

// MARK: - Handle State

private extension Main.VC {
    func stateNone() {}
}

// MARK: - Target / Action

private extension Main.VC {
    @objc func tapButton(_ sender: UIButton) {
        router.showDropMenu(on: sender)
    }
}

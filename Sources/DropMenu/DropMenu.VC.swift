//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import Combine
import UIKit

extension DropMenu {
    final class VC: UIViewController {
        var vo = DropMenu.VO()
        var vm = DropMenu.VM()
        var router = DropMenu.Router()
        var binding = Set<AnyCancellable>()
        var firstInit = true
        lazy var dataSource = makeDataSource()
        weak var onButton: UIButton?
        weak var delegate: DropMenuDelegate?
        
        override func loadView() {
            self.view = vo.mainView
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupSelf()
            setupBinding()
            setupVO()
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            if firstInit == false { return }
            firstInit = true
            doReloadUI()
        }
        
        override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
            super.willTransition(to: newCollection, with: coordinator)
            coordinator.animate { _ in
                
            } completion: { _ in
                self.doReloadUI()
            }

        }
    }
}

// MARK: - UITableViewDataSource

extension DropMenu.VC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let option = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = option.title
        return cell
    }
}

// MARK: - UITableViewDelegate

extension DropMenu.VC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let option = dataSource[indexPath.row]
        delegate?.dropMenu(menu: self, selected: option)
    }
}

// MARK: - Public Functions

extension DropMenu.VC {
    func showIn(_ vc: UIViewController) {
        modalPresentationStyle = .overFullScreen
        vc.present(self, animated: false)
    }
}

// MARK: - Setup Something

private extension DropMenu.VC {
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
        vo.list.delegate = self
        vo.list.dataSource = self
        vo.dismissButton.addTarget(self, action: #selector(tapToDismiss), for: .touchUpInside)
    }
}

// MARK: - Handle State

private extension DropMenu.VC {
    func stateNone() {}
}

// MARK: - Do Action

private extension DropMenu.VC {
    func doReloadUI() {
        guard let frame = delegate?.dropMenuShowOnRect() else { return }
        
        let height = delegate?.dropMenuHeight()
        vo.reloadUI(frame: frame, height: height)
        vo.list.reloadData()
    }
}

// MARK: - Target / Action

private extension DropMenu.VC {
    @objc func tapToDismiss() {
        dismiss(animated: false)
    }
}

// MARK: - Make Something

private extension DropMenu.VC {
    func makeDataSource() -> [DropMenu.Models.DisplayOption] {
        return [
            .init(title: "Option1"),
            .init(title: "Option2"),
            .init(title: "Option3"),
            .init(title: "Option4"),
        ]
    }
}

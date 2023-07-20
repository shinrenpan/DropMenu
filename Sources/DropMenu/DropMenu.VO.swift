//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import UIKit

extension DropMenu {
    final class VO {
        lazy var mainView = makeMainView()
        lazy var list = makeList()
        lazy var dismissButton = makeDismissButton()
        
        init() {
            addDismissButton()
        }
    }
}

// MARK: - Reload Somethig

extension DropMenu.VO {
    func reloadUI(frame: CGRect, height: CGFloat? = nil) {
        list.removeFromSuperview()
        list.removeConstraints(list.constraints)
        
        let top = frame.maxY + 8
        let leading = frame.minX
        let trailing = frame.maxX - mainView.frame.maxX
        let height = height ?? mainView.frame.height / 2
        
        mainView.addSubview(list)
        NSLayoutConstraint.activate([
            list.topAnchor.constraint(equalTo: mainView.topAnchor, constant: top),
            list.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: leading),
            list.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: trailing),
            list.heightAnchor.constraint(equalToConstant: height),
        ])
    }
}

// MARK: - Add Something

private extension DropMenu.VO {
    func addDismissButton() {
        mainView.addSubview(dismissButton)
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: mainView.topAnchor),
            dismissButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            dismissButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            dismissButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
        ])
    }
}

// MARK: - Make Something

private extension DropMenu.VO {
    func makeMainView() -> UIView {
        let result = UIView(frame: .zero)
        result.backgroundColor = .init(white: 0, alpha: 0.1)
        return result
    }
    
    func makeList() -> UITableView {
        let result = UITableView(frame: .zero, style: .plain)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = .white
        result.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        result.rowHeight = 60
        result.clipsToBounds = true
        result.layer.cornerRadius = 10
        return result
    }
    
    func makeDismissButton() -> UIButton {
        let result = UIButton(type: .custom)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = .clear
        return result
    }
}

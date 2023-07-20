//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import UIKit

extension Main {
    final class VO {
        lazy var mainView = makeMainView()
        lazy var button = makeOptionButton()
        
        init() {
            addButton()
        }
    }
}

// MARK: - Reload Somethig

extension Main.VO {}

// MARK: - Add Something

private extension Main.VO {
    func addButton() {
        mainView.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 40),
            button.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 18),
            button.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -18),
            button.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}

// MARK: - Make Something

private extension Main.VO {
    func makeMainView() -> UIView {
        let result = UIView(frame: .zero)
        return result
    }
    
    func makeOptionButton() -> UIButton {
        let result = UIButton(type: .system)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.clipsToBounds = true
        result.layer.cornerRadius = 8
        result.layer.borderWidth = 1
        result.layer.borderColor = UIColor.darkText.cgColor
        result.setImage(.init(systemName: "chevron.down"), for: .normal)
        result.setTitle("更多", for: .normal)
        result.semanticContentAttribute = .forceRightToLeft
        return result
    }
}

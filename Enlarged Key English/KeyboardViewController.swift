//
//  KeyboardViewController.swift
//  Enlarged Key English
//
//  Created by Lujain sh on 23/12/2024.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    let groupStackView = UIStackView()
    let enlargedKeyStackView = UIStackView()
    let predictiveTextBar = UIStackView()
    var clipboardButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupGroupKeys()
        setupEnlargedKeys()
        setupPredictiveTextBar()
    }

    private func setupGroupKeys() {
        groupStackView.axis = .horizontal
        groupStackView.distribution = .fillEqually
        groupStackView.spacing = 10

        // Add group buttons
        for group in ["QWERTY", "ASDF", "ZXCV", "hjasjd", "lkjlkj"] {
            let button = createButton(title: group)
            button.addTarget(self, action: #selector(handleGroupTap(_:)), for: .touchUpInside)
            groupStackView.addArrangedSubview(button)
        }

        groupStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(groupStackView)

        // Constraints
        NSLayoutConstraint.activate([
            groupStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            groupStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            groupStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10)
        ])
    }

    private func setupEnlargedKeys() {
        enlargedKeyStackView.axis = .horizontal
        enlargedKeyStackView.distribution = .fillEqually
        enlargedKeyStackView.spacing = 40
        enlargedKeyStackView.isHidden = true // Initially hidden

        view.addSubview(enlargedKeyStackView)
        enlargedKeyStackView.translatesAutoresizingMaskIntoConstraints = false

        // Constraints
        NSLayoutConstraint.activate([
            enlargedKeyStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            enlargedKeyStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            enlargedKeyStackView.topAnchor.constraint(equalTo: groupStackView.bottomAnchor, constant: 10)
        ])
    }

    private func setupPredictiveTextBar() {
        // Configure the predictive text bar
        predictiveTextBar.axis = .horizontal
        predictiveTextBar.distribution = .fillProportionally
        predictiveTextBar.spacing = 10

        // Add predictive text buttons
        let leftSuggestion = createButton(title: "hi")
        let rightSuggestion = createButton(title: "How are you?")
        clipboardButton = createClipboardButton()

        predictiveTextBar.addArrangedSubview(leftSuggestion)
        predictiveTextBar.addArrangedSubview(clipboardButton)
        predictiveTextBar.addArrangedSubview(rightSuggestion)

        predictiveTextBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(predictiveTextBar)

        // Constraints
        NSLayoutConstraint.activate([
            predictiveTextBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            predictiveTextBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            predictiveTextBar.topAnchor.constraint(equalTo: enlargedKeyStackView.bottomAnchor, constant: 10),
            predictiveTextBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func handleGroupTap(_ sender: UIButton) {
        guard let title = sender.title(for: .normal) else { return }

        enlargedKeyStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        // Add enlarged keys for the tapped group
        let keys: [String]
        switch title {
        case "QWERTY":
            keys = ["Q", "W", "E", "R", "T", "Y"]
        case "ASDF":
            keys = ["A", "S", "D", "F"]
        case "ZXCV":
            keys = ["Z", "X", "C", "V"]
        default:
            keys = []
        }

        for key in keys {
            let button = createButton(title: key)
            button.addTarget(self, action: #selector(handleKeyTap(_:)), for: .touchUpInside)
            enlargedKeyStackView.addArrangedSubview(button)
        }

        enlargedKeyStackView.isHidden = false
    }

    @objc private func handleKeyTap(_ sender: UIButton) {
        guard let title = sender.title(for: .normal) else { return }
        textDocumentProxy.insertText(title)
    }

    @objc private func openClipboardPage() {
        let clipboardVC = MyClipboardViewController()
        present(clipboardVC, animated: true, completion: nil)
    }

    private func createClipboardButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "doc.on.clipboard"), for: .normal) // Clipboard icon
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(openClipboardPage), for: .touchUpInside)
        return button
    }

    private func createButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 8
        return button
    }
}

//
//  KeyboardViewController.swift
//  Enlarged Keys English
//
//  Created by Maryam Amer Bin Siddique on 18/06/1446 AH.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    // MARK: - Variables
    var clusters: [[String]] = [
        ["q", "w", "e", "r", "t", "y"], // Cluster 1
        ["u", "i", "o", "p"],          // Cluster 2
        ["a", "s", "d", "f", "g", "h"],// Cluster 3
        ["j", "k", "l"],               // Cluster 4
        ["z", "x", "c", "v", "b", "n", "m"] // Cluster 5
    ]
    var isExpanded = false
    var selectedCluster: [String] = []
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboard()
    }
    
    // MARK: - Setup Keyboard Layout
    func setupKeyboard() {
        let keyboardView = createKeyboardView()
        view.addSubview(keyboardView)
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            keyboardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardView.topAnchor.constraint(equalTo: view.topAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Create Keyboard View
    func createKeyboardView() -> UIView {
        let container = UIStackView()
        container.axis = .vertical
        container.spacing = 5
        container.distribution = .fillEqually
        
        if isExpanded {
            // Display expanded cluster
            let expandedRow = UIStackView()
            expandedRow.axis = .horizontal
            expandedRow.spacing = 5
            expandedRow.distribution = .fillEqually
            
            for letter in selectedCluster {
                let button = createKey(title: letter)
                expandedRow.addArrangedSubview(button)
            }
            container.addArrangedSubview(expandedRow)
        } else {
            // Display clusters
            for cluster in clusters {
                let row = UIStackView()
                row.axis = .horizontal
                row.spacing = 5
                row.distribution = .fillEqually
                
                let button = createKey(title: cluster.joined())
                button.tag = clusters.firstIndex(of: cluster) ?? 0
                row.addArrangedSubview(button)
                container.addArrangedSubview(row)
            }
        }
        
        // Add default keys (space, backspace, return)
        let defaultKeys = createDefaultKeys()
        container.addArrangedSubview(defaultKeys)
        
        return container
    }
    
    // MARK: - Create Key Button
    func createKey(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(keyTapped(_:)), for: .touchUpInside)
        return button
    }
    
    // MARK: - Create Default Keys
    func createDefaultKeys() -> UIView {
        let defaultRow = UIStackView()
        defaultRow.axis = .horizontal
        defaultRow.spacing = 5
        defaultRow.distribution = .fillProportionally
        
        let spaceKey = createKey(title: "space")
        let returnKey = createKey(title: "return")
        let backspaceKey = createKey(title: "⌫")
        
        spaceKey.addTarget(self, action: #selector(spaceTapped), for: .touchUpInside)
        returnKey.addTarget(self, action: #selector(returnTapped), for: .touchUpInside)
        backspaceKey.addTarget(self, action: #selector(backspaceTapped), for: .touchUpInside)
        
        defaultRow.addArrangedSubview(spaceKey)
        defaultRow.addArrangedSubview(returnKey)
        defaultRow.addArrangedSubview(backspaceKey)
        return defaultRow
    }
    
    // MARK: - Actions
    @objc func keyTapped(_ sender: UIButton) {
        let key = sender.title(for: .normal) ?? ""
        
        if isExpanded {
            textDocumentProxy.insertText(key)
            isExpanded = false
            selectedCluster = []
        } else {
            // Expand cluster
            if let index = sender.tag as Int? {
                selectedCluster = clusters[index]
                isExpanded = true
            }
        }
        setupKeyboard()
    }
    
    @objc func spaceTapped() {
        textDocumentProxy.insertText(" ")
    }
    
    @objc func returnTapped() {
        textDocumentProxy.insertText("\n")
    }
    
    @objc func backspaceTapped() {
        textDocumentProxy.deleteBackward()
    }
}

//import UIKit
//
//class KeyboardViewController: UIInputViewController {
//
//    @IBOutlet var nextKeyboardButton: UIButton!
//    
//    override func updateViewConstraints() {
//        super.updateViewConstraints()
//        
//        // Add custom view sizing constraints here
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Perform custom UI setup here
//        self.nextKeyboardButton = UIButton(type: .system)
//        
//        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
//        self.nextKeyboardButton.sizeToFit()
//        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
//        
//        self.view.addSubview(self.nextKeyboardButton)
//        
//        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
//        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//    }
//    
//    override func viewWillLayoutSubviews() {
//        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
//        super.viewWillLayoutSubviews()
//    }
//    
//    override func textWillChange(_ textInput: UITextInput?) {
//        // The app is about to change the document's contents. Perform any preparation here.
//    }
//    
//    override func textDidChange(_ textInput: UITextInput?) {
//        // The app has just changed the document's contents, the document context has been updated.
//        
//        var textColor: UIColor
//        let proxy = self.textDocumentProxy
//        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
//            textColor = UIColor.white
//        } else {
//            textColor = UIColor.black
//        }
//        self.nextKeyboardButton.setTitleColor(textColor, for: [])
//    }
//
//}

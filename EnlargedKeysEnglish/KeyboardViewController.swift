import UIKit

class KeyboardViewController: UIInputViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the keyboard view
        let keyboardView = UIView()
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keyboardView)
        
        NSLayoutConstraint.activate([
            keyboardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardView.topAnchor.constraint(equalTo: view.topAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Add buttons
        let buttonTitles = [
            ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
            ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
            ["z", "x", "c", "v", "b", "n", "m"]
        ]

        let rowsStackView = UIStackView()
        rowsStackView.axis = .vertical
        rowsStackView.spacing = 8
        rowsStackView.translatesAutoresizingMaskIntoConstraints = false
        keyboardView.addSubview(rowsStackView)

        NSLayoutConstraint.activate([
            rowsStackView.leadingAnchor.constraint(equalTo: keyboardView.leadingAnchor, constant: 10),
            rowsStackView.trailingAnchor.constraint(equalTo: keyboardView.trailingAnchor, constant: -10),
            rowsStackView.topAnchor.constraint(equalTo: keyboardView.topAnchor, constant: 10),
            rowsStackView.bottomAnchor.constraint(equalTo: keyboardView.bottomAnchor, constant: -10)
        ])

        for row in buttonTitles {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 5
            rowStackView.distribution = .fillEqually

            for title in row {
                let button = UIButton(type: .system)
                button.setTitle(title, for: .normal)
                button.addTarget(self, action: #selector(keyPressed(_:)), for: .touchUpInside)
                button.backgroundColor = .lightGray
                button.layer.cornerRadius = 5
                rowStackView.addArrangedSubview(button)
            }

            rowsStackView.addArrangedSubview(rowStackView)
        }
    }

    @objc func keyPressed(_ sender: UIButton) {
        guard let title = sender.title(for: .normal) else { return }
        textDocumentProxy.insertText(title)
    }
}

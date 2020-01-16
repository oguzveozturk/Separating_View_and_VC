//
//  FirstView.swift
//  Programmatically UI
//
//  Created by Oguz on 29.12.2019.
//  Copyright © 2019 Oguz. All rights reserved.
//

import UIKit

protocol FirstViewDelegate: class {
    func goButton(secondVC: SecondViewController, didTapGoButton: UIButton)
}

class FirstView: UIView, SecondViewControllerDelegate {
    
    weak var delegate: FirstViewDelegate?
    
    let secondView = SecondViewController()
    
    @objc func didTapGoButton(_ button: UIButton) {
        delegate?.goButton(secondVC: secondView, didTapGoButton: go)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.462745098, green: 0.8392156863, blue: 1, alpha: 1)
        addSubview(go)
        setupLayouts()
        secondView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let go: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        button.setTitle("Go", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .regular)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.cornerRadius = 20
        button.setTitleColor(#colorLiteral(red: 0.462745098, green: 0.8392156863, blue: 1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(didTapGoButton(_:)), for: .touchUpInside)
        return button
    }()
    
    func setupLayouts() {
        NSLayoutConstraint.activate([
            go.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            go.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: (self.frame.height/3)),
            go.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1),
            go.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
        ])
    }
    
    //MARK: - SecondViewControllerDelegate
    
    func changeFirstViewColor(color: UIColor) {
        self.backgroundColor = color
        go.setTitleColor(self.backgroundColor, for: .normal)
    }
}



//
//  SecondView.swift
//  Programmatically UI
//
//  Created by Oguz on 29.12.2019.
//  Copyright © 2019 Oguz. All rights reserved.
//

import UIKit

protocol SecondViewDelegate: class {
    
    func changeButton(didTapChangeButton: UIButton)
}

class SecondView: UIView {
    
     weak var delegate: SecondViewDelegate?
    
    @objc func didTapChangeButton(_ button: UIButton) {
        delegate?.changeButton(didTapChangeButton: change)
     }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1)
        addSubview(change)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     let change: UIButton = {
         let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         button.backgroundColor = #colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)
         button.setTitle("Change", for: .normal)
         button.titleLabel?.font = .systemFont(ofSize: 30, weight: .regular)
         button.titleLabel?.adjustsFontSizeToFitWidth = true
         button.layer.cornerRadius = 20
         button.setTitleColor(#colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1), for: .normal)
         button.addTarget(self, action: #selector(didTapChangeButton(_:)), for: .touchUpInside)
         return button
     }()
     
     func setupLayouts() {
         NSLayoutConstraint.activate([
             change.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             change.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: (self.frame.height/5)),
             change.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1),
             change.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
             
         ])
     }
}

//
//  SecondViewController.swift
//  Programmatically UI
//
//  Created by Oguz on 29.12.2019.
//  Copyright © 2019 Oguz. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func changeFirstViewColor(color: UIColor)
}

class SecondViewController: UIViewController, SecondViewDelegate {
    
    var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let secondView = SecondView(frame: view.bounds)
        secondView.delegate = self
        view = secondView
    }
    
    //MARK: - SecondViewDelegate
    
    func changeButton(didTapChangeButton: UIButton) {
        delegate?.changeFirstViewColor(color: .random)
        dismiss(animated: true, completion: nil)
    }
}




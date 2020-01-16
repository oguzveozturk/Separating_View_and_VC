//
//  ViewController.swift
//  Programmatically UI
//
//  Created by Oguz on 29.12.2019.
//  Copyright © 2019 Oguz. All rights reserved.
//

import UIKit


class ViewController: UIViewController, FirstViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstView = FirstView(frame: view.bounds)
        firstView.delegate = self
        view = firstView
    }
    
    //MARK: - FirstViewDelegate
    
    func goButton(secondVC: SecondViewController, didTapGoButton: UIButton) {
        secondVC.view.backgroundColor = .random
        present(secondVC, animated: true, completion: nil)
    }
}

//
//  ViewController.swift
//  oddeven
//
//  Created by DCS on 13/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let btnx:UIButton = {
        let button = UIButton()
        button.setTitle("Even / Odd", for: .normal)
        button.addTarget(self, action: #selector(clickx),for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 6
        return button
    }()
    private let txt:UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightGray
        text.textColor = .white
        text.textAlignment = .center
        text.placeholder = "enter value"
        return text
    }()
    @objc private func clickx()
    {
        print("checking..")
        
        guard let num = Int(txt.text!) else {
            let alert = UIAlertController(title: "Worning!!", message: "Please enter a number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
            return
        }
        
        let vc = ResultVC()
        
        if num % 2 == 0 {
            vc.result = "even"
        } else {
            vc.result = "odd"
        }
        
        navigationController?.pushViewController(vc, animated: false)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btnx)
        view.addSubview(txt)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        btnx.frame = CGRect(x: 40, y: (view.height/2) - 50, width: view.width - 80, height:60)
        txt.frame = CGRect(x: 40, y: (view.height/2) - 100, width: view.width - 80, height: 30)
    }
   
}


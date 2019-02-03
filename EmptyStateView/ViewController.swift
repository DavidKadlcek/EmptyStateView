//
//  ViewController.swift
//  EmptyStateView
//
//  Created by David Kadlček on 03/02/2019.
//  Copyright © 2019 David Kadlček. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var emptyView: EmptyStateView = {
        let view = EmptyStateView(image: UIImage(named: "hamburger")!, title: "Opps...!", message: "Something went wrong!", buttonText: "Try again")
        view.messageLabel.font = UIFont(name: ".SFUIText-Medium", size: 20)
        view.titleLabel.font = UIFont(name: ".SFUIText-Bold", size: 30)
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(emptyView)
        emptyView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emptyView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        emptyView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }


}

extension ViewController: EmptyStateViewDelegate {
    func handleTapOnButton() {
        print("Button clicked")
    }
    
    
}


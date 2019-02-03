//
//  EmptyStateView.swift
//  EmptyStateView
//
//  Created by David Kadlček on 03/02/2019.
//  Copyright © 2019 David Kadlček. All rights reserved.
//

import UIKit

public protocol EmptyStateViewDelegate: class {
    func handleTapOnButton()
}

public class EmptyStateView: UIView {
    
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.font = UIFont(name: ".SFUIText-Bold", size: 25)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    public lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = message
        label.font = UIFont(name: ".SFUIText-Medium", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    public lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(buttonText, for: .normal)
        button.titleLabel?.font = UIFont(name: ".SFUIText-Bold", size: 25)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    private let image: UIImage?
    private let title: String?
    private let message: String?
    private let buttonText: String?
    
    public weak var delegate: EmptyStateViewDelegate?
    
    public init(image: UIImage, title: String, message: String? = nil, buttonText: String? = nil) {
        self.image = image
        self.title = title
        self.message = message
        self.buttonText = buttonText
        super.init(frame: UIScreen.main.bounds)
        translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleTap() {
        delegate?.handleTapOnButton()
    }
    
    private func setupConstraints() {
        let sizeOfImageView = CGSize(width: self.frame.width / 3, height: self.frame.width / 3)
        
        imageView.heightAnchor.constraint(equalToConstant: sizeOfImageView.height).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: sizeOfImageView.width).isActive = true
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        
        if message != nil {
            stackView.addArrangedSubview(messageLabel)
        }
        if buttonText != nil {
            let sizeOfButton = button.titleLabel?.intrinsicContentSize ?? CGSize(width: 150, height: 50)
            
            button.heightAnchor.constraint(equalToConstant: sizeOfButton.height + 5).isActive = true
            button.widthAnchor.constraint(equalToConstant: sizeOfButton.width + 10).isActive = true
            
            stackView.addArrangedSubview(button)
        }
        
        self.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(lessThanOrEqualToConstant: self.frame.width - 32).isActive = true
        stackView.heightAnchor.constraint(lessThanOrEqualToConstant: self.frame.height - 32).isActive = true
    }
    
}

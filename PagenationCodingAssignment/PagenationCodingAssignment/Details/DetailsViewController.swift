//
//  DetailsViewController.swift
//  PagenationCodingAssignment
//
//  Created by Vijay Reddy on 28/05/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        view.backgroundColor = .white
        setupLabels()
        
        if let post = post {
            titleLabel.text = post.title
            titleLabel.numberOfLines = 2
            titleLabel.textAlignment = .center
            bodyLabel.text = post.body
        }
    }
    
    private func setupLabels() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.numberOfLines = 0
        
        view.addSubview(titleLabel)
        view.addSubview(bodyLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            bodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bodyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}


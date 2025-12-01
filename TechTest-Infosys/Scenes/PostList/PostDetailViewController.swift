//
//  PostDetailViewController.swift
//  TechTest-Infosys
//
//  Created by Stefan Jivalino on 02/12/25.
//

import UIKit

class PostDetailViewController: UIViewController {
    private let post: Post
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    init(post: Post) {
        self.post = post
        super.init(nibName: "PostDetailViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = post.title
        bodyLabel.text = post.body
        
    }
}

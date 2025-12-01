//
//  PostListViewController.swift
//  TechTest-Infosys
//
//  Created by Stefan Jivalino on 01/12/25.
//

import UIKit
import RxSwift
import RxCocoa

class PostListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel = PostListViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always

        title = "All Posts"
        
        let nib = UINib(nibName: "PostCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PostCell")
        tableView.delegate = self
        tableView.contentInsetAdjustmentBehavior = .automatic
        
        bindViewModel()
        viewModel.loadPosts()
    }

    private func bindViewModel() {
        viewModel.posts
            .bind(to: tableView.rx.items(cellIdentifier: "PostCell", cellType: PostCell.self)) { index, post, cell in
                cell.judulLabel.text = post.title
            }
            .disposed(by: disposeBag)

        viewModel.errorMessage
            .subscribe(onNext: { [weak self] message in
                self?.showAlert(message)
            })
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Post.self)
                .subscribe(onNext: { [weak self] post in
                    self?.goToDetail(post: post)
                })
                .disposed(by: disposeBag)
    }
    
    private func goToDetail(post: Post) {
        let detailVC = PostDetailViewController(post: post)
        navigationController?.pushViewController(detailVC, animated: true)
    }

    private func showAlert(_ msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension PostListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


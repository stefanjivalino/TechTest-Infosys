//
//  PostListViewModel.swift
//  TechTest-Infosys
//
//  Created by Stefan Jivalino on 01/12/25.
//

import RxSwift
import RxCocoa

class PostListViewModel {

    private let repository = PostRepository()
    private let disposeBag = DisposeBag()

    // Output
    let posts = BehaviorRelay<[Post]>(value: [])
    let isLoading = BehaviorRelay<Bool>(value: false)
    let errorMessage = PublishRelay<String>()

    func loadPosts() {
        isLoading.accept(true)

        repository.fetchPosts()
            .subscribe(
                onSuccess: { [weak self] items in
                    self?.isLoading.accept(false)
                    self?.posts.accept(items)
                },
                onFailure: { [weak self] error in
                    self?.isLoading.accept(false)
                    self?.errorMessage.accept(error.localizedDescription)
                }
            )
            .disposed(by: disposeBag)
    }
}


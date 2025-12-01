//
//  PostRepository.swift
//  TechTest-Infosys
//
//  Created by Stefan Jivalino on 01/12/25.
//

import RxSwift

class PostRepository {

    private let provider = NetworkProvider<PostApi>()

    func fetchPosts() -> Single<[Post]> {
        provider.request(.getPosts, type: [Post].self)
    }
}



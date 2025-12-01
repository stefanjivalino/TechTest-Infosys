//
//  PostRepositoryMock.swift
//  TechTest-Infosys
//
//  Created by Stefan Jivalino on 02/12/25.
//

import Foundation
import RxSwift
@testable import TechTest_Infosys

class PostRepositoryMock: PostRepository {

    var shouldReturnError = false

    override func fetchPosts() -> Single<[Post]> {
        if shouldReturnError {
            return .error(NSError(domain: "TestError", code: -1))
        }

        // Mock data
        let mockPosts = [
            Post(id: 1, userId: 1, title: "Mock Title 1", body: "Mock body 1"),
            Post(id: 2, userId: 1, title: "Mock Title 2", body: "Mock body 2")
        ]

        return .just(mockPosts)
    }
}

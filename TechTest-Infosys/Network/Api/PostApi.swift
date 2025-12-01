//
//  PostApi.swift
//  TechTest-Infosys
//
//  Created by Stefan Jivalino on 01/12/25.
//

import Moya
internal import Alamofire

enum PostApi {
    case getPosts
}

extension PostApi: TargetType {
    var baseURL: URL { URL(string: "https://jsonplaceholder.typicode.com")! }

    var path: String {
        switch self {
        case .getPosts: return "/posts"
        }
    }

    var method: Moya.Method { .get }

    var task: Task { .requestPlain }

    var headers: [String : String]? { ["Content-Type": "application/json"] }

    var sampleData: Data { Data() }
}



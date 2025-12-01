//
//  NetworkProvider.swift
//  TechTest-Infosys
//
//  Created by Stefan Jivalino on 01/12/25.
//

import Moya
import RxSwift

class NetworkProvider<T: TargetType> {
    private let provider = MoyaProvider<T>(plugins: [NetworkLoggerPlugin()])

    func request<U: Decodable>(_ target: T, type: U.Type) -> Single<U> {
        provider.rx.request(target)
            .filterSuccessfulStatusCodes()
            .map(U.self)
    }
}



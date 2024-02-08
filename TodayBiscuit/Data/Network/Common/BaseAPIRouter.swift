//
//  BaseAPIRouter.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation

import Alamofire

public protocol BaseAPIRouter {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var parameters: [String: Any]? { get }
    var encoding: ParameterEncoding? { get }
}

//참고: https://jkim68888.tistory.com/18 [Jihyun Kim:티스토리]

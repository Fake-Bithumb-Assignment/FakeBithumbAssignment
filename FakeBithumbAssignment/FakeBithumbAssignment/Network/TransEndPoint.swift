//
//  TransactionEndPoint.swift
//  FakeBithumbAssignment
//
//  Created by 박예빈 on 2022/03/07.
//

import Foundation

enum TransEndPoint {
    case getTransData(orderCurrency: String, paymentCurrency: String)
    
    var requestTimeOut: Float {
        return 20
    }
    
    var httpMethod: HttpMethod {
        switch self {
        case .getTransData:
            return .GET
        }
    }
    
    var requestBody: Data? {
        switch self {
        case .getTransData:
            return nil
        }
    }
    
    func getURL(from environment: HttpEnvironment) -> String {
        let baseUrl = environment.baseUrl
        switch self {
        case .getTransData(let orderCurrency, let paymentCurrency):
            return "\(baseUrl)/transaction_history/\(orderCurrency)_\(paymentCurrency)?count=80"
        }
    }
    
    func createRequest(environment: HttpEnvironment) -> NetworkRequest {
        var headers: [String: String] = [:]
        headers["Content-Type"] = "application/json"
        return NetworkRequest(url: getURL(from: environment),
                              headers: headers,
                              reqBody: requestBody,
                              reqTimeout: requestTimeOut,
                              httpMethod: httpMethod)
    }
}
//
//  Data+Extension.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/7/24.
//

import Foundation

extension Data {
    var toPrettyPrintedString: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        return prettyPrintedString as String
    }
}

// https://ios-development.tistory.com/733?category=899471

//
//  String+Extension.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/15/24.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, value: "undefined", comment: "")
    }
}

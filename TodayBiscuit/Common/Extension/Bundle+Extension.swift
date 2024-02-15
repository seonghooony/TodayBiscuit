//
//  Bundle+Extension.swift
//  TodayBiscuit
//
//  Created by SeongHoon Kim on 12/2/23.
//

import Foundation



extension Bundle {
    /*
        bundle ID를 반환한다.
     */
    public static var bundleIdentifier: String {
        guard
            let dictionary = Bundle.main.infoDictionary,
            let identifier = dictionary["CFBundleIdentifier"] as? String
        else { return "" }
        
        return identifier
    }
    
    /*
        앱 이름을 반환한다.
     */
    public static var appName: String {
        guard
            let dictionary = Bundle.main.infoDictionary,
            let appName = dictionary["CFBundleName"] as? String
        else { return "" }
        
        return appName
    }
    
    /*
        설치된 App Version 값을 반환한다.
    */
    public static var appVersion: String {
        guard
            let dictionary = Bundle.main.infoDictionary,
            let version = dictionary["CFBundleShortVersionString"] as? String,
            let _ = dictionary["CFBundleVersion"] as? String
        else { return "" }

        return version
    }
    
    var KecoSvcKey_Decoding: String? {
        return infoDictionary?["KecoSvcKey_Decoding"] as? String
    }
}

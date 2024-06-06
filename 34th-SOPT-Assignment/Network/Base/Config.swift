//
//  Config.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 5/9/24.
//

import Foundation

enum Config {
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let key = "KEY"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist cannot found")
        }
        return dict
    }()
}

extension Config {
    static let baseURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration")
        }
        return key
    }()
    
    static let key: String = {
        guard let key = Config.infoDictionary[Keys.Plist.key] as? String else {
            fatalError("key is not set in plist for this configuration")
        }
        return key
    }()
}

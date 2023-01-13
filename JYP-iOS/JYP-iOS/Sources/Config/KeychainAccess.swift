//
//  Keychain.swift
//  JYP-iOS
//
//  Created by 송영모 on 2023/01/11.
//  Copyright © 2023 JYP-iOS. All rights reserved.
//

import Foundation

import KeychainAccess

enum KeychainAccessKey: String {
    case accessToken
    case nickname
    case profileImagePath
}

final class KeychainAccess {
    static var keychain: Keychain {
        return Keychain(service: "jyp.journeypiki")
    }
    
    static func get(key: KeychainAccessKey) -> String? {
        return self.keychain[key.rawValue]
    }
    
    static func set(key: KeychainAccessKey, value: String) throws {
        try self.keychain.set(value, key: key.rawValue)
    }
    
    static func remove(key: KeychainAccessKey) throws {
        try self.keychain.remove(key.rawValue)
    }
}

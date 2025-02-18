//
//  PersonalityId.swift
//  JYP-iOS
//
//  Created by 송영모 on 2022/09/21.
//  Copyright © 2022 JYP-iOS. All rights reserved.
//

import UIKit

enum PersonalityID: String, Codable {
    case ME
    case PE
    case RT
    case FW

    init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .FW
    }

    var title: String {
        switch self {
        case .ME:
            return "꼼꼼한 탐험가"
        case .PE:
            return "열정왕 탐험가"
        case .RT:
            return "낭만적인 여행자"
        case .FW:
            return "자유로운 방랑자"
        }
    }
    
    var defaultImagePath: String {
        switch self {
        case .ME:
            return "https://journeypiki.duckdns.org/static/profile_me.png"
        case .PE:
            return "https://journeypiki.duckdns.org/static/profile_pe.png"
        case .RT:
            return "https://journeypiki.duckdns.org/static/profile_rt.png"
        case .FW:
            return "https://journeypiki.duckdns.org/static/profile_fw.png"
        }
    }
    
    static func toSelf(title: String) -> PersonalityID {
        switch title {
        case PersonalityID.ME.title:
            return .ME
        case PersonalityID.PE.title:
            return .PE
        case PersonalityID.RT.title:
            return .RT
        case PersonalityID.FW.title:
            return .FW
        default:
            return .ME
        }
    }

    static func toSelf(journey: Bool, place: Bool, plan: Bool) -> PersonalityID {
        if (journey && place && plan) || (!journey && place && plan) {
            return .ME
        } else if (journey && !place && plan) || (journey && place && !plan) {
            return .PE
        } else if (!journey && !place && plan) || (!journey && place && !plan) {
            return .RT
        } else {
            return .FW
        }
    }
}

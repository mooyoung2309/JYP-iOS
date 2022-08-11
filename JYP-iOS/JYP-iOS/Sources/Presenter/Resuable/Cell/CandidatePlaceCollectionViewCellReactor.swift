//
//  CandidatePlaceCollectionViewCellReactor.swift
//  JYP-iOS
//
//  Created by 송영모 on 2022/08/11.
//  Copyright © 2022 JYP-iOS. All rights reserved.
//

import ReactorKit

class CandidatePlaceCollectionViewCellReactor: Reactor {
    typealias Action = NoAction
    
    let initialState: CandidatePlace
    
    init(candidatePlace: CandidatePlace) {
        initialState = candidatePlace
    }
}

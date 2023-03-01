//
//  JourneyPlanReactor.swift
//  JYP-iOS
//
//  Created by 송영모 on 2022/08/18.
//  Copyright © 2022 JYP-iOS. All rights reserved.
//

import UIKit
import ReactorKit

class JourneyPlanReactor: Reactor {
    enum Action {
        case refresh(Journey)
        case fetch
        case tapEditButton(IndexPath, PikiCollectionReusableViewReactor.State)
        case tapPlusButton(IndexPath, EmptyPikiCollectionViewCellReactor.State)
    }
    
    enum Mutation {
        case setJourney(Journey)
        case setSections([JourneyPlanSectionModel])
    }
    
    struct State {
        var journey: Journey?
        var sections: [JourneyPlanSectionModel] = []
    }
    
    var initialState: State
    
    init() {
        self.initialState = State()
    }
}

extension JourneyPlanReactor {
    func bind(action: Action) {
        self.action.onNext(action)
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .refresh(journey):
            return .concat([
                .just(.setJourney(journey)),
                .just(.setSections(makeSections(from: journey)))
            ])
            
        default: return .empty()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case let .setJourney(Journey): newState.journey = Journey
        case let .setSections(sections): newState.sections = sections
        }
        
        return newState
    }
    
    private func makeSections(from journey: Journey) -> [JourneyPlanSectionModel] {
        var sections: [JourneyPlanSectionModel] = []
        
        let dayItems = journey.pikidays.enumerated().map { (index, _) -> JourneyPlanItem in
            return JourneyPlanItem.dayTag(DayTagCollectionViewCellReactor(state: .init(day: index + 1)))
        }
        
        if dayItems.isEmpty == false {
            sections.append(.init(model: .day(dayItems), items: dayItems))
        }
        
        journey.pikidays.enumerated().forEach { (index, pikiday) in
            var journeyPlanItems: [JourneyPlanItem] = []
            
            if pikiday.pikis.isEmpty {
                let sectionItem = JourneyPlanItem.emptyPlan(.init(index: index, startDate: Date(timeIntervalSince1970: journey.startDate)))
                
                journeyPlanItems.append(sectionItem)
            } else {
                let sectionItems = pikiday.pikis.enumerated().map { (index, pik) -> JourneyPlanItem in
                    return JourneyPlanItem.plan(PikiCollectionViewCellReactor(state: .init(isLast: index == pikiday.pikis.count - 1, order: index, date: DateManager.addDateComponent(byAdding: .day, value: index, to: Date(timeIntervalSince1970: journey.startDate)), pik: pik)))
                }
                
                journeyPlanItems.append(contentsOf: sectionItems)
            }
            
            sections.append(.init(model: .journey(journeyPlanItems), items: journeyPlanItems))
        }
        return sections
    }
}

//
//  AppReducer.swift
//  SwiftUI_CRUD_TCA
//
//  Created by Luciano Puzer on 07/03/22.
//

import SwiftUI
import ComposableArchitecture

let appReducer: Reducer<AppState, AppAction, AppEnvironment> = CardReducer.forEach(
    state: \AppState.cards,
    action: /AppAction.card(index:action:),
    environment: { _ in CardEnvironment() }
)
    .debug()
//let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
//
//    switch action {
//
//    case .cardCheckboxTapped(index: let index):
//        state.cards[index].isCompleted.toggle()
//        return .none
//    case .nameTextFieldChanged(index: let index, text: let text):
//        state.cards[index].name = text
//        return .none
//    case .phoneTextFieldChange(index: let index, text: let text):
//        state.cards[index].phone = text
//        return .none
//    case .cardColorChanged(index: let index, text: let text):
//        state.cards[index].cardColor = text
//        return .none
//    case .fontColorChanged(index: let index, text: let text):
//        state.cards[index].fontColor = text
//        return .none
//    }
//}.debug()


//A reducer to CardAction
let CardReducer = Reducer<Card, CardAction, CardEnvironment>{
    state, action, environment in
    
    switch action {
    case .checkboxTapped:
        state.isCompleted.toggle()
        return .none
        
    case .nameTextFieldChanged(let text):
        state.name = text
        return .none
        
    case .phoneTextFieldChanged(let text):
        state.phone = text
        return .none
    }
    
    
}

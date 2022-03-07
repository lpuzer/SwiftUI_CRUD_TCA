//
//  AppAction.swift
//  SwiftUI_CRUD_TCA
//
//  Created by Luciano Puzer on 07/03/22.
//

import SwiftUI
import ComposableArchitecture


enum AppAction {
// a general case for all action
    case AddButtonTapped
    case card(index:Int, action: CardAction)
    
// one case for each action
//    case cardCheckboxTapped(index: Int)
//    case nameTextFieldChanged(index: Int, text: String)
//    case phoneTextFieldChange(index: Int, text: String)
//    case cardColorChanged(index: Int, text: String)
//    case fontColorChanged(index: Int, text: String)
}

//Action controll for any specific row
enum CardAction {
    case checkboxTapped
    case nameTextFieldChanged(String)
    case phoneTextFieldChanged(String)
}

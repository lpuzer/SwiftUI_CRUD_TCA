//
//  AppAction.swift
//  SwiftUI_CRUD_TCA
//
//  Created by Luciano Puzer on 07/03/22.
//

import SwiftUI
import ComposableArchitecture


enum AppAction {
    case cardCheckboxTapped(index: Int)
    case nameTextFieldChanged(index: Int, text: String)
    case phoneTextFieldChange(index: Int, text: String)
    case cardColorChanged(index: Int, text: String)
    case fontColorChanged(index: Int, text: String)
}

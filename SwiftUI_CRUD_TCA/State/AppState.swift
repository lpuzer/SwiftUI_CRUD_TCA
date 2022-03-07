//
//  AppState.swift
//  SwiftUI_CRUD_TCA
//
//  Created by Luciano Puzer on 07/03/22.
//

import SwiftUI
import ComposableArchitecture


struct Card: Equatable, Identifiable {
    var id: UUID
    var name: String = ""
    var phone: String = ""
    var cardColor: String = ""
    var fontColor: String = ""
    var isCompleted:Bool = false
    }


struct AppState: Equatable {
    var cards:[Card] = []
}

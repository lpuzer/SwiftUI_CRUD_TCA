//
//  SwiftUI_CRUD_TCAApp.swift
//  SwiftUI_CRUD_TCA
//
//  Created by Luciano Puzer on 06/03/22.
//

import SwiftUI
import ComposableArchitecture

@main
struct SwiftUI_CRUD_TCAApp: App {
    var body: some Scene {
        WindowGroup {
            ContactListtView(
                store: Store(
                    initialState: AppState(cards: [
                        Card(
                        id: UUID(),
                        name: "Yoda",
                        phone: "99999999",
                        cardColor: "yellow",
                        fontColor: "pink",
                        isCompleted: true
                    ),
                     Card(
                         id: UUID(),
                         name: "Ahsoka",
                         phone: "888888888",
                         cardColor: "pink",
                         fontColor: "white",
                         isCompleted: false
                     ),
                     Card(
                         id: UUID(),
                         name: "Anakin",
                         phone: "777777777",
                         cardColor: "green",
                         fontColor: "blue",
                         isCompleted: false
                     )
                    ]),
                    reducer: appReducer,
                    environment: AppEnvironment()
                )
            )
        }
    }
}

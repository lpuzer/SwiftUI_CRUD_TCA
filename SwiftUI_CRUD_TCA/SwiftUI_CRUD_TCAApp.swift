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
            ContentView(
                store: Store(
                    initialState: AppState(cards: [Card(
                        id: UUID(),
                        name: "Luciano",
                        phone: "995052166",
                        cardColor: "cardColor",
                        fontColor: "fontColor",
                        isCompleted: true
                    )]),
                    reducer: appReducer,
                    environment: AppEnvironment()
                )
            )
        }
    }
}

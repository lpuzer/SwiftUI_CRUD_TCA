//
//  ContentView.swift
//  SwiftUI_CRUD_TCA
//
//  Created by Luciano Puzer on 06/03/22.
//

import SwiftUI
import ComposableArchitecture


struct ContactListtView: View {
//    init(){
//        UITableView.appearance().backgroundColor = UIColor(named: "mainBackground")
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
//    }
    let store: Store<AppState, AppAction>
        
    var body: some View {
        NavigationView {
            WithViewStore(self.store) { viewStore in
                List{
                    //A way to take out the index stuffs
                    ForEachStore(
                        self.store.scope(state: \.cards,
                            action: AppAction.card(index: action:)
                            ),
                        content: CardView.init(store:)
                        )
                    Spacer()
                }.listRowBackground(Color("mainBackground"))
                    .listRowSeparator(.hidden)
                .navigationTitle("Contact List")
                .navigationBarItems(trailing: Button("Add") {
                    viewStore.send(.AddButtonTapped)
                })
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContactListtView(
                store: Store(
                    initialState: AppState(
                        cards:
                            [Card(
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
                            ]
                    ),
                    reducer: appReducer,
                    environment: AppEnvironment()
                )
            )
                .preferredColorScheme(.dark)
            ContactListtView(
                store: Store(
                    initialState: AppState(
                        cards:
                            [Card(
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
                            ]
                    ),
                    reducer: appReducer,
                    environment: AppEnvironment()
                )
            )
                .preferredColorScheme(.light)
        }
    }
}

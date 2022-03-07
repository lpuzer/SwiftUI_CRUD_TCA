//
//  ContentView.swift
//  SwiftUI_CRUD_TCA
//
//  Created by Luciano Puzer on 06/03/22.
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

enum AppAction {
    case cardCheckboxTapped(index: Int)
    case nameTextFieldChanged(index: Int, text: String)
    case phoneTextFieldChange(index: Int, text: String)
    case cardColorChanged(index: Int, text: String)
    case fontColorChanged(index: Int, text: String)
}

struct AppEnvironment {
    
}

let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    
    switch action {

    case .cardCheckboxTapped(index: let index):
        state.cards[index].isCompleted.toggle()
        return .none
    case .nameTextFieldChanged(index: let index, text: let text):
        state.cards[index].name = text
        return .none
    case .phoneTextFieldChange(index: let index, text: let text):
        state.cards[index].phone = text
        return .none
    case .cardColorChanged(index: let index, text: let text):
        state.cards[index].cardColor = text
        return .none
    case .fontColorChanged(index: let index, text: let text):
        state.cards[index].fontColor = text
        return .none
    }
}.debug()


struct ContentView: View {
    let store: Store<AppState, AppAction>
    
    var body: some View {
        NavigationView {
            WithViewStore(self.store) { viewStore in
                List{
                    ForEach(Array(viewStore.cards.enumerated()), id: \.element.id) { index, item in
                        VStack (alignment: .leading, spacing: 5){
                            
                            Button(action: {
                                viewStore.send(.cardCheckboxTapped(index: index))
                            }) {
                                Image(systemName: item.isCompleted ? "checkmark.square" : "square")
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            TextField(
                                "Name",
                                text: viewStore.binding(
                                    get: { $0.cards[index].name },
                                    send: { .nameTextFieldChanged(index: index, text: $0)
                                    }
                                )
                            )
                            
                            TextField(
                                "Phone",
                                text: viewStore.binding(
                                    get: { $0.cards[index].phone },
                                    send: { .phoneTextFieldChange(index: index, text: $0)
                                    }
                                )
                            )
                        }
                        .font(.title)
                        .frame(width: 300, height: 100)
                        .padding()
                        .background(Color(item.cardColor))
                        .foregroundColor(Color(item.fontColor))
                        .cornerRadius(20)
                    }
                    Spacer()
                }
                .navigationTitle("Contact List")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
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
    }
}

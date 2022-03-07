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
    var cards:[Card]
}

enum AppAction {
    
}

struct AppEnvironment {
    
}

let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    
    switch action {

    }
   
}


struct ContentView: View {
    let store: Store<AppState, AppAction>
    
    var body: some View {
        NavigationView {
            WithViewStore(self.store) { viewStore in
                List{
                    ForEach(viewStore.cards) { item in
                        VStack (alignment: .leading, spacing: 5){
                            Text(item.name)
                                .bold()
                            Text(item.phone)
                        }
                        .font(.title)
                        .padding(.horizontal)
                        .frame(width: 350, height: 100)
                        .background(Color("cardColor"))
                        .foregroundColor(Color("fontColor"))
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
                            name: "Luciano",
                            phone: "995052166",
                            cardColor: "cardColor",
                            fontColor: "fontColor",
                            isCompleted: true
                        )
                        ]
                ),
                reducer: appReducer,
                environment: AppEnvironment()
            )
        )
    }
}

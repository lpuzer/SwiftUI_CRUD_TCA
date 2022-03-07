//
//  CardView.swift
//  SwiftUI_CRUD_TCA
//
//  Created by Luciano Puzer on 07/03/22.
//

import SwiftUI
import ComposableArchitecture

struct CardView: View {
    let store: Store<Card, CardAction>
    
    var body: some View {
        
        WithViewStore(self.store) { viewStore in

    VStack (alignment: .leading, spacing: 5){
        
        Button(action: {
            viewStore.send(.checkboxTapped)
        }) {
            Image(systemName: viewStore.isCompleted ? "square" : "checkmark.square")
        }
        .buttonStyle(PlainButtonStyle())
        
        TextField(
            "Name",
            text: viewStore.binding(
                get: \.name,
                send: CardAction.nameTextFieldChanged
            )
        )
        
        TextField(
            "Phone",
            text: viewStore.binding(
                get: \.phone,
                send: CardAction.phoneTextFieldChanged
            )
        )
    }
    .font(.title)
    .frame(width: 300, height: 100)
    .padding()
    .background(Color(viewStore.cardColor))
    .foregroundColor(viewStore.isCompleted ? Color(viewStore.fontColor).opacity(0.2) : Color(viewStore.fontColor))
    .cornerRadius(20)
}
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(store: Store<Card, CardAction>)
//    }
//}

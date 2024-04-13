//
//  ContentView.swift
//  Developers
//
//  Created by Kathiravan Murali on 23/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(alignment: .center,spacing: 20, content:
            {
                ForEach(Cards) { card in
                    CardView(card: card)
                }
            })// Hstack
            .padding(20)
        }
        
        
        
    }
}

#Preview {
    ContentView()
}

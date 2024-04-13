//
//  CardView.swift
//  Developers
//
//  Created by Kathiravan Murali on 23/01/24.
//

import SwiftUI
import AVFoundation

struct CardView: View {
    
    var card : Card
    
    @State private var showAlert : Bool = false
    @State private var fadeIn : Bool = false
    @State private var move : Bool = false
    
    var impact = UIImpactFeedbackGenerator(style: .light)
    
    var body: some View {
        ZStack {
            
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
            
            VStack {
                
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .italic()
                
            }// Vstack
            .offset(y: move ? -218 : -300)
            
            Button {
                playAudio(sound: "sound-chime", format: "mp3")
                impact.impactOccurred()
                showAlert.toggle()
            } label: {
                HStack {
                    
                    Text(card.callToAction.uppercased())
                        .underline(false)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .accentColor(.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(.system(size: 30))
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                    
                }// Hstack
                .padding(.vertical)
                .padding(.horizontal,24)
                .background(LinearGradient(colors: card.gradientColors, startPoint: .topTrailing, endPoint: .bottomLeading))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 10)
            }// Mark - button
            .buttonStyle(.borderless)
            .underline(false)
            .offset(y: move ? 210 : 300)

            
        }// Zstack
        .frame(width: 335,height: 545)
        .background(LinearGradient(colors: card.gradientColors, startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 10)
        .onAppear(perform: {
            withAnimation(.linear(duration: 1.0))
            {
                self.fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8))
            {
                self.move.toggle()
            }
        })
        .alert(isPresented: $showAlert)
        {
            Alert(title: Text(card.title),message: Text(card.message),dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    CardView(card: Cards[3])
}

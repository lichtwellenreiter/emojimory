//
//  MemoryGameStartView.swift
//  Emojimory
//
//  Created by Florian Thiévent on 01.10.20.
//

import SwiftUI

struct MemoryGameStartView: View {
    
    @Binding var gameStarted: Bool
    @State var showingSettings = false
    
    var body: some View {
        VStack{
            Text("Emojimory").font(.custom("Couture-Bold", size: 35))
            Text("🤷🏻‍♂️").font(.system(size: 120))
            
            Button(action: {
                self.gameStarted = true
            }, label: {
                Text("Start a new Game")
            })
            Spacer()
            HStack{
                
                Button(action: {
                    self.showingSettings.toggle()
                }, label: {
                    Image("settings")
                }).sheet(isPresented: $showingSettings){
                    SettingsView()
                }
            }.padding().frame(height:100, alignment: .trailing)
            
            
            
        }
    }
}

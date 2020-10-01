//
//  MemoryGameView.swift
//  Emojimory
//
//  Created by Florian Thiévent on 17.09.20.
//

import SwiftUI

struct MemoryGameView: View {
    
    @State var showingDetail = false
    @State var showingSettings = false
    @ObservedObject var viewModel: MemoryGameViewModel
    
    var body: some View {
        VStack{
            HStack{
                ForEach(viewModel.cards){card in
                    CardView(card: card).onTapGesture {
                        self.viewModel.choose(card: card)
                    }
                }
            }.padding()
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

struct CardView:View{
    
    var card: MemoryGameModel<String>.Card
    
    var body: some View {
        GeometryReader{ geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize)-> some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius:cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: lineWidth)
                    .foregroundColor(.blue)
                    .animation(.easeIn)
                Text(card.content).font(.system(size: fontSize(size)))
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: lineWidth)
                    .foregroundColor(.blue)
                Text("🤷🏻‍♂️").font(.system(size: fontSize(size)))
            }
        }.aspectRatio(aspectRatio, contentMode: .fit)
    }
    
    
    // MARK: - Drawing Constants
    let cornerRadius = CGFloat(10)
    let lineWidth = CGFloat(3)
    let aspectRatio = CGFloat(0.75)
    private func fontSize(_ size: CGSize)->CGFloat{
        min(size.height, size.width) * 0.8
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(viewModel: MemoryGameViewModel())
    }
}

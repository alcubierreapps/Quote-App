//
//  QuoteDetailView.swift
//  Quotes Test
//
//  Created by Alcubierre Holdings Inc. on 2022-01-08.
//

import SwiftUI

struct QuoteDetailView: View {
    //MARK: Properties
    
    var quote: Quote
    @State private var pulsate: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            //Author
            ZStack{
                Image(quote.image)
                    .resizable()
                    .frame(height: 150, alignment: .center)
                
                Text(quote.author)
                    .font(.system(.largeTitle, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3, x: 0, y: 3)
            }
            .edgesIgnoringSafeArea(.top)
            .overlay(
                HStack{
                    Spacer()
                    VStack{
                        Button(action: {
                            //Action
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "chevron.down.circle.fill")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .shadow(radius: 4)
                                .opacity(self.pulsate ? 1.1 : 0.6)
                                .scaleEffect(self.pulsate ? 1.1 : 0.95, anchor: .center)
                                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                            
                        })
                            .padding(.trailing, 20)
                            .padding(.top, 10)
                        Spacer()
                    }
                }
            )
            .onAppear(){
                self.pulsate.toggle()
            }
            
            //Quotes
            VStack(alignment: .leading){
                ForEach(quote.moreQuotes, id: \.self){ item in
                    VStack(alignment: .leading, spacing: 15){
                        Text(item)
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .font(.system(.body))
                            
                        Divider()
                    }
                }
            }
            .padding()
            
        }
    }
}

struct QuoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteDetailView(quote: Quote.testData())
    }
}

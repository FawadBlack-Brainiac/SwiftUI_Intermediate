//
//  ScrollViewReaderSwiftUIView.swift
//  SwiftUI_Intermediate
//
//  Created by mary akber on 31/08/2024.
//

import SwiftUI

struct ScrollViewReaderSwiftUIView: View {
    
    @State var scrollIndex = 0
    @State var scrollTextField = ""
    
    var body: some View {
        VStack{
            TextField("Enter the search Keyword", text: $scrollTextField)
                .padding()
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Scroll To Given Index") {
                withAnimation(.spring) {
                    if let index = Int(scrollTextField){
                        scrollIndex = index
                    }
                }
                
            }
            
            ScrollView{
                ScrollViewReader{ proxy in
                    
                    ForEach(1..<50){
                        index in
                        Text("I am item no \(index)")
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .background(Color.white)
                            .border(Color.blue, width: 3)
                            .cornerRadius(10.0)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollIndex) {
                        proxy.scrollTo(scrollIndex, anchor: .top)
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    ScrollViewReaderSwiftUIView()
}

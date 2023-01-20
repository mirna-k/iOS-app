//
//  ContentView.swift
//  PersonalDiary
//
//  Created by student on 17.01.2023..
//

import SwiftUI

struct ContentView: View {
    
    let image = "avatar"
    @State var isSignedIn = true
    let columnLayout = Array(repeating: GridItem(), count: 2)
    @State private var selectedText = ""
    @EnvironmentObject var eventData: EventData

    let gridItems: [String] = [
        "Images",
        "Event planer",
        "Notes",
        "Friends"
    ]
    
    var body: some View {
        VStack{
            HStack{
                Image(image)
                    .resizable()
                    .frame(width: 55, height:55)
                    .clipShape(Circle())
                Text("Title").font(.title).bold()
                Spacer()
                Button(action: {isSignedIn = true}){ Text("Login") }
            }.padding(.leading, 20).padding([.bottom, .trailing], 20)
            
            ScrollView{
                LazyVGrid(columns: columnLayout, spacing: 9){
                    ForEach(gridItems, id: \.self){
                        item in
                        Button{
                            selectedText = item
                        } label: {
                            ZStack(alignment: .center){
                                RoundedRectangle(cornerRadius: 4.0)
                                    .aspectRatio(1.0, contentMode: ContentMode.fit)
                                    .foregroundColor(.pink)
                                Text(item).foregroundColor(.white).bold()
                            }
                            
                        }.buttonStyle(.plain)
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

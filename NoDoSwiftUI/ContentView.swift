//
//  ContentView.swift
//  NoDoSwiftUI
//
//  Created by Venkatesh on 2/17/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var nodo : String = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 5) {
                    Image(systemName: "plus.circle")
                        .padding(.leading)
                    Group {
                        TextField("type here",text:self.$nodo, onEditingChanged: { (changed) in
                            print(changed)
                        }) {
                            print("commit time")
                        }.padding(.all, 12)
                    }.background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(radius: 5)
                        .padding(.trailing, 8)
                }
                
                List {
                    Text("hai there")
                }
            }.navigationBarTitle(Text("NoDo"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

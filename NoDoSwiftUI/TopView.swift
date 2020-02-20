//
//  TopView.swift
//  NoDoSwiftUI
//
//  Created by Gabriel on 2/19/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import SwiftUI

struct TopView: View {
    
    @Binding var nodoList : [NoDo]
    @Binding var nodoItem : NoDo
    @Binding var isTextFldShown : Bool

    var placeHolder = "Type nodo here"
    
    var body: some View {
        ZStack {
            ZStack(alignment: .leading) {
                TextField(placeHolder, text: self.$nodoItem.name) {
                    self.nodoList.insert(NoDo(name: self.nodoItem.name, isDone: false), at: 0)
                    self.save()
                    self.nodoItem.name = ""
                }.padding(.all, 10)
                    .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                    .background(Color.blue)
                    .cornerRadius(30)
                    .foregroundColor(.white)
                    .offset(x: self.isTextFldShown ? 0 : (-UIScreen.main.bounds.width / 2 - 180))
                    .animation(.spring())
                    .accentColor(.white)

                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.orange)
                    .offset(x: self.isTextFldShown ?  (UIScreen.main.bounds.width  - 90) : -30)
                    .animation(.spring())
                    .onTapGesture {
                        self.isTextFldShown.toggle()
                }
            }.padding(.top, 20)
                .padding(.leading, 5)
        }
    }
    
    func save() {
        guard let data = try? JSONEncoder().encode(self.nodoList) else {
            return
        }
        UserDefaults.standard.set(data,forKey: "nodos")
        UserDefaults.standard.synchronize()
    }
}

//struct TopView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopView()
//    }
//}

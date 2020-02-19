//
//  NoDoRow.swift
//  NoDoSwiftUI
//
//  Created by Gabriel on 2/19/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import SwiftUI

struct NoDoRow: View {
    @State var nodoItem : NoDo
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Group {
                HStack {
                    Text(self.nodoItem.name)
                        .foregroundColor(.white)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Image(systemName: self.nodoItem.isDone ? "checkmark" : "square")
                        .padding()
                }
                HStack(alignment: .center, spacing: 3) {
                    Spacer()
                    Text("Added : \(self.nodoItem.dateString)")
                        .foregroundColor(.white)
                        .italic()
                        .padding(.all, 5)
                }.padding(.bottom, 4)
            }.padding(.all, 4)
        }.background(self.nodoItem.isDone ? Color.gray : Color.pink)
            .cornerRadius(8)
            .blur(radius: self.nodoItem.isDone ? 1 : 0)
            .onTapGesture {
                self.nodoItem.isDone.toggle()
        }
    }
}

//struct NoDoRow_Previews: PreviewProvider {
//    static var previews: some View {
//        NoDoRow()
//    }
//}

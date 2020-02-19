//
//  ContentView.swift
//  NoDoSwiftUI
//
//  Created by Venkatesh on 2/17/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var nodoList : [NoDo] = {
        guard let data = UserDefaults.standard.data(forKey: "nodos") else {return []}
            
        if let nodoList = try? JSONDecoder().decode([NoDo].self, from: data) {
            return nodoList
        }
        
        return[]
    }()
    @State var nodoItem = NoDo()
    @State var isTextFldShown = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing:5) {
                    TopView(nodoList: self.$nodoList, nodoItem: self.$nodoItem, isTextFldShown: self.$isTextFldShown)
                }
                List {
                    ForEach(self.nodoList) { item in
                        NoDoRow(nodoItem: item)
                    }.onDelete(perform: deleteRow)
                }
            }.navigationBarTitle("NoDo")
        }
    }
    
    func deleteRow(at offsets : IndexSet) {
        guard let index = Array(offsets).first else {
            return
        }
        self.nodoList.remove(at: index)
        save()
    }
    
    func save() {
        guard let data = try? JSONEncoder().encode(self.nodoList) else {
            return
        }
        UserDefaults.standard.set(data,forKey: "nodos")
    }
}

/*
 struct ContentView: View {
 @State var nodo : String = ""
 @State var nodoList = [String]()
 
 var body: some View {
 NavigationView {
 VStack {
 HStack(spacing: 5) {
 Image(systemName: "plus.circle")
 .padding(.leading)
 Group {
 TextField("Type here",text:self.$nodo, onEditingChanged: { (changed) in
 print(changed)
 }) {
 self.nodoList.insert(self.nodo, at: 0)
 self.nodo = ""
 }.padding(.all, 12)
 }
 .background(Color.green)
 .clipShape(RoundedRectangle(cornerRadius: 5))
 .shadow(radius: 5)
 .padding(.trailing, 8)
 }
 
 List {
 ForEach(self.nodoList, id: \.self) { item in
 NoDoRow(item:item)
 }.onDelete(perform: deleteItem)
 }
 }.navigationBarTitle(Text("NoDo"))
 }
 }
 
 func deleteItem(at offset : IndexSet)  {
 guard let index = offset.first else {return}
 self.nodoList.remove(at: index)
 }
 }
 
 struct NoDoRow : View {
 @State var item : String = ""
 @State var isTapped = false
 var body : some View {
 VStack(alignment: .center, spacing: 2) {
 Group {
 HStack {
 Text(item)
 .foregroundColor(.white)
 .font(.title)
 Spacer()
 Image(systemName: self.isTapped ? "checkmark" : "square")
 .padding()
 }
 
 HStack {
 Spacer()
 Text(timeAgoSinceDate(Date()))
 .foregroundColor(.white)
 .font(.subheadline)
 }.padding()
 }
 .padding(.all, 4)
 }.background(self.isTapped ? Color.gray : Color.pink)
 .cornerRadius(8)
 .onTapGesture {
 self.isTapped.toggle()
 }
 }
 
 func timeAgoSinceDate(_ date:Date, numericDates:Bool = false) -> String {
 let calendar = NSCalendar.current
 let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
 let now = Date()
 let earliest = now < date ? now : date
 let latest = (earliest == now) ? date : now
 let components = calendar.dateComponents(unitFlags, from: earliest,  to: latest)
 
 if (components.year! >= 2) {
 return "\(components.year!) years ago"
 } else if (components.year! >= 1){
 if (numericDates){
 return "1 year ago"
 } else {
 return "Last year"
 }
 } else if (components.month! >= 2) {
 return "\(components.month!) months ago"
 } else if (components.month! >= 1){
 if (numericDates){
 return "1 month ago"
 } else {
 return "Last month"
 }
 } else if (components.weekOfYear! >= 2) {
 return "\(components.weekOfYear!) weeks ago"
 } else if (components.weekOfYear! >= 1){
 if (numericDates){
 return "1 week ago"
 } else {
 return "Last week"
 }
 } else if (components.day! >= 2) {
 return "\(components.day!) days ago"
 } else if (components.day! >= 1){
 if (numericDates){
 return "1 day ago"
 } else {
 return "Yesterday"
 }
 } else if (components.hour! >= 2) {
 return "\(components.hour!) hours ago"
 } else if (components.hour! >= 1){
 if (numericDates){
 return "1 hour ago"
 } else {
 return "An hour ago"
 }
 } else if (components.minute! >= 2) {
 return "\(components.minute!) minutes ago"
 } else if (components.minute! >= 1){
 if (numericDates){
 return "1 minute ago"
 } else {
 return "A minute ago"
 }
 } else if (components.second! >= 3) {
 return "\(components.second!) seconds ago"
 } else {
 return "Just now"
 }
 
 }
 }
 */

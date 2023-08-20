//
//  ContentView.swift
//  iDineSwiftUITutorial
//
//  Created by Umut Barış Çoşkun on 20.08.2023.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
       
        NavigationStack{
            List{
                ForEach(menu) {
                    section in
                    
                    Section(section.name){
                        ForEach(section.items){
                            item in
                            NavigationLink(value:item) {
                              ItemRow(item: item)
                                
                            }
                        }
                    }
                    
                    
                }
            }.navigationDestination(for: MenuItem.self){
                item in
                ItemDetailView(item: item)
            }
            
            .navigationTitle("Menu")
                .listStyle(.grouped)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

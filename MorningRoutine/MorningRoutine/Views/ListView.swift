//
//  ListView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/5/22.
//

import SwiftUI

struct ListView: View {
    @State var items : [ItemModel] = [
        ItemModel(title: "Hi", time: 120),
        ItemModel(title: "Hello", time: 150),
        ItemModel(title: "Hey there", time: 100)
    ]
    @State var title : String = "Actions"
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(text: item.title, time: item.timeAsString())
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(title)
        .navigationBarItems (
            leading: EditButton(),
            trailing: Label("Add", systemImage: "plus")
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}

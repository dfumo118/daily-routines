//
//  ListView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/5/22.
//

import SwiftUI

struct ListView: View {
    @State var items : [String] = [
        "Hi",
        "Hello",
        "Hey there"
    ]
    @State var title : String = "Actions"
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(text: item)
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

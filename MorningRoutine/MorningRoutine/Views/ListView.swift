//
//  ListView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/5/22.
//

import SwiftUI

struct ListView: View {
    @State var type : Item
    @State var items : [ItemModel] = [
        ItemModel(title: "Hi", time: 120),
        ItemModel(title: "Hello", time: 150),
        ItemModel(title: "Hey there", time: 100)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(
            "\(type.rawValue.capitalized)s"
        )
        .navigationBarItems (
            leading: EditButton(),
            trailing: NavigationLink(
                destination: type == .actn ?
                    AnyView(AddActionView())  : AnyView(AddRoutineView()),
                label: {
                    Label("Add", systemImage: "plus")
                }
            )
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView(type: .actn)
        }
    }
}

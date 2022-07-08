//
//  ListView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/5/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var type : Item
    
    var body: some View {
        List {
            ForEach(listViewModel.actions) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteAction)
            .onMove(perform: listViewModel.moveAction)
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
        .environmentObject(ListViewModel())
    }
}

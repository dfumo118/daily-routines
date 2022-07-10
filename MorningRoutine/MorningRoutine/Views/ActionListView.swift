//
//  ListView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/5/22.
//

import SwiftUI

struct ActionListView: View {
    
    @EnvironmentObject var actionListViewModel: ActionListViewModel
    
    var body: some View {
        List {
            ForEach(actionListViewModel.actions) { action in
                ActionListRowView(action: action)
            }
            .onDelete(perform: actionListViewModel.deleteAction)
            .onMove(perform: actionListViewModel.moveAction)
        }
        .listStyle(PlainListStyle())
        .navigationTitle(
            "Actions"
        )
        .navigationBarItems (
            leading: EditButton(),
            trailing: NavigationLink(
                destination: AddActionView(),
                label: {
                    Label("Add", systemImage: "plus")
                }
            )
        )
    }
}

struct ActionListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ActionListView()
        }
        .environmentObject(ActionListViewModel())
    }
}

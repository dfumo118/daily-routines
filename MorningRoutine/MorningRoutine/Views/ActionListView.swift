//
//  ListView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/5/22.
//

import SwiftUI

struct ActionListView: View {
    
    @ObservedObject var actionListViewModel : ActionListViewModel
    
    init(routine: RoutineModel) {
        actionListViewModel = ActionListViewModel(routine: routine)
    }
    
    var body: some View {
        ZStack {
            List {
                ForEach(actionListViewModel.routine.actions) {
                    ActionListRowView(action: $0)
                }
                .onDelete(perform: actionListViewModel.deleteAction)
                .onMove(perform: actionListViewModel.moveAction)
            }
            .listStyle(.plain)
            .navigationTitle(
                actionListViewModel.routine.name
            )
            .navigationBarItems (
                leading: EditButton(),
                trailing: NavigationLink(
                    destination: AddActionView(actionListViewModel: actionListViewModel),
                    label: {
                        Label("Add", systemImage: "plus")
                    }
                )
            )
        }
    }
}

struct ActionListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ActionListView(routine: RoutineModel(name: "Routine 1", actions : [
                    ActionModel(title: "Hi", time: 120),
                    ActionModel(title: "Hello", time: 150),
                    ActionModel(title: "Hey there", time: 100)
                ]))
        }
    }
}

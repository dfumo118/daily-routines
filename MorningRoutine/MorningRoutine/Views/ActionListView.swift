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
        VStack {
            ZStack {
                List {
                    ForEach(actionListViewModel.routine.actions) {
                        ActionListRowView(action: $0)
                    }
                    .onDelete(perform: actionListViewModel.deleteAction)
                    .onMove(perform: actionListViewModel.moveAction)
                }
                .listStyle(.plain)
                .navigationBarItems (
                    trailing: NavigationLink(
                        destination: AddActionView(actionListViewModel:     actionListViewModel),
                        label: {
                            Label("Add", systemImage: "plus")
                        }
                    )
                )
                
                if actionListViewModel.routine.actions.isEmpty {
                    EmptyActionListView(title: actionListViewModel.routine.name)
                        .padding(.bottom, 150)
                }
            }
        }
    }
}

struct ActionListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ActionListView(routine: RoutineModel(name: "Routine 1", actions : [
                    ]))
        }
    }
}

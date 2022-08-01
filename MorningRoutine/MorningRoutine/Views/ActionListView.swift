//
//  ListView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/5/22.
//

import SwiftUI

struct ActionListView: View {
    
    @Environment(\.editMode) var editMode
    @EnvironmentObject var rLVM : RoutineListViewModel
    
    @Binding var routine : RoutineModel
    
    var body: some View {
        VStack {
            ZStack {
                List {
                    ForEach(routine.actions) {
                        ActionListRowView(routineId: routine.id, action: $0)
                    }
                    .onDelete(perform: {
                        indexSet in
                        rLVM.deleteAction(
                            id: routine.id,
                            indexSet: indexSet)
                    })
                    .onMove(perform: { from, to in
                        rLVM.moveAction(id: routine.id, from: from, to: to)
                    })
                }
                .listStyle(.plain)
                .navigationBarItems (
                    trailing: NavigationLink(
                        destination: AddActionView(routineId: routine.id),
                        label: {
                            Text("Add Action")
                        }
                    )
                )
                
                if routine.actions.isEmpty && editMode?.wrappedValue.isEditing == false {
                    EmptyActionListView(title: routine.name)
                        .padding(.bottom, 150)
                }
            }
            .onChange(of: rLVM.routines[rLVM.findRoutine(id: routine.id)].actions.count) { value in
                routine = rLVM.routines[rLVM.findRoutine(id: routine.id)]
            }
        }
    }
}

struct ActionListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            //ActionListView(routine:)
        }
        .environmentObject(RoutineListViewModel())
    }
}

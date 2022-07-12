//
//  RoutineListView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/12/22.
//

import SwiftUI

struct RoutineListView: View {
    
    @EnvironmentObject var routineListViewModel : RoutineListViewModel
    
    var body: some View {
       
        ZStack {
            List {
                ForEach(routineListViewModel.routines) {
                    RoutineListRowView(routine: $0)
                }
                .onDelete(perform: routineListViewModel.deleteRoutine)
                .onMove(perform: routineListViewModel.moveRoutine)
            }
            .listStyle(.plain)
            .navigationTitle(
                "Routines"
            )
            .navigationBarItems (
                leading: EditButton(),
                trailing: NavigationLink(
                    destination: AddRoutineView(),
                    label: {
                        Label("Add", systemImage: "plus")
                    }
                )
            )
        }
        
    }
}

struct RoutineListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoutineListView()
        }
        .environmentObject(RoutineListViewModel())
    }
}

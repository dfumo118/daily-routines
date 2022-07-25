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
    
    @State var num : Int
    
    var body: some View {
        VStack {
            ZStack {
                List {
                    ForEach(rLVM.routines[num].actions) {
                        ActionListRowView(num: num, action: $0)
                    }
                    .onDelete(perform: {
                        indexSet in
                        rLVM.deleteAction(num: num,
                                          indexSet: indexSet)
                    })
                    .onMove(perform: { from, to in
                        rLVM.moveAction(num: num, from: from, to: to)
                    })
                }
                .listStyle(.plain)
                .navigationBarItems (
                    trailing: NavigationLink(
                        destination: AddActionView(num: num),
                        label: {
                            Text("Add Action")
                        }
                    )
                )
                
                if rLVM.routines[num].actions.isEmpty && editMode?.wrappedValue.isEditing == false {
                    EmptyActionListView(title: rLVM.routines[num].name)
                        .padding(.bottom, 150)
                }
            }
        }
        .onChange(of: editMode!.wrappedValue,
                  perform: { value in
//            if !value.isEditing {
//                rLVM.changeActions(num: num, actions: actionListViewModel.routine.actions)
//            }
        })
    }
}

struct ActionListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ActionListView(num: 0)
        }
        .environmentObject(RoutineListViewModel())
    }
}

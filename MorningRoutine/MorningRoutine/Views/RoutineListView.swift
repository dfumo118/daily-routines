//
//  RoutineListView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/12/22.
//

import SwiftUI

struct RoutineListView: View {
    
    @EnvironmentObject var rLVM : RoutineListViewModel
    
    var body: some View {
       
        VStack {
            ZStack {
                List {
                    ForEach(rLVM.routines.indices, id: \.self) {
                        index in
                        RoutineListRowView(routine: $rLVM.routines[index])
                    }
                    .onDelete(perform: rLVM.deleteRoutine)
                    .onMove(perform: rLVM.moveRoutine)
                }
                .listStyle(.plain)
                .navigationTitle(
                    "routines"
                )
                .navigationBarItems (
                    leading: rLVM.routines.isEmpty ?
                    AnyView(EmptyView()) : AnyView(EditButton()
                        .textCase(.lowercase)
                                                  ),
                    trailing: NavigationLink(
                        destination: AddRoutineView(),
                        label: {
                            Label("add", systemImage: "plus")
                        }
                    )
                )
                
                if rLVM.routines.isEmpty {
                    EmptyRoutineListView()
                        .padding(.bottom, 150)
                }
            }
        }
        .animation(.spring(), value: rLVM.routines.isEmpty)
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

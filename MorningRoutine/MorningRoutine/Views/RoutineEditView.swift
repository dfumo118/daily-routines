//
//  RoutineEditView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/17/22.
//

import SwiftUI

struct RoutineEditView: View {
    
    @Environment(\.editMode) var editMode
    @EnvironmentObject var rLVM : RoutineListViewModel
    
    @State var num : Int
    @State var fieldText : String = ""
    
    var body: some View {
        VStack {
            if editMode?.wrappedValue.isEditing == true {
                TextField(rLVM.routines[num].name, text: $fieldText)
                    .padding()
                    .onAppear {
                        fieldText = rLVM.routines[num].name
                    }
            }
            if !rLVM.routines[num].actions.isEmpty &&
                editMode!.wrappedValue.isEditing == false
            {
                NavigationLink(
                    destination: RoutineInteractView(routine: rLVM.routines[num]),
                    label: { Text("Start") }
                )
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(
                    red: rLVM.routines[num].color[0],
                    green: rLVM.routines[num].color[1],
                    blue: rLVM.routines[num].color[2],
                    opacity: 0.7
                ))
                .foregroundColor(.white)
                .cornerRadius(10)
                
            }
            ActionListView(num: num)
        }
        .padding()
        .navigationTitle(
            rLVM.routines[num].name
        )
        .onChange(of: editMode!.wrappedValue, perform: { value in
            if !value.isEditing {
                rLVM.changeName(num: num, name: fieldText)
            }
        })
    }
}

struct RoutineEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoutineEditView(num: 0)
        }.environmentObject(RoutineListViewModel())
    }
}

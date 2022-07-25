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
    @State var selectedColor : Color = .red
    
    var body: some View {
        VStack {
            if editMode?.wrappedValue.isEditing == true {
                VStack {
                    TextField(rLVM.routines[num].name, text: $fieldText)
                        .padding()
                        .onAppear {
                            fieldText = rLVM.routines[num].name
                        }
                    ColorPicker("Change Routine Color", selection: $selectedColor, supportsOpacity: false)
                        .padding()
                        .onAppear {
                            selectedColor = Color(
                                red: rLVM.routines[num].color[0],
                                green: rLVM.routines[num].color[1],
                                blue: rLVM.routines[num].color[2]
                            )
                        }
                }
            }
            if !rLVM.routines[num].actions.isEmpty &&
                editMode!.wrappedValue.isEditing == false
            {
                NavigationLink(
                    destination: RoutineInteractView(routine: rLVM.routines[num]),
                    label: {
                        Text("Start - \(rLVM.routines[num].timeAsSentence())")
                    }
                )
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(
                    red: rLVM.routines[num].color[0],
                    green: rLVM.routines[num].color[1],
                    blue: rLVM.routines[num].color[2],
                    opacity: 0.7
                ))
                .foregroundColor(rLVM.routines[num].color.reduce(0, +) > 2 ? .black : .white)
                .cornerRadius(10)
                
            }
            ActionListView(num: num)
        }
        .padding()
        .navigationTitle(
            rLVM.routines[num].name
        )
        .navigationBarItems (
            trailing: EditButton()
        )
        
        .onChange(of: editMode!.wrappedValue, perform: { value in
            if !value.isEditing {
                rLVM.changeName(num: num, name: fieldText)
                rLVM.changeColor(num: num, color: UIColor(selectedColor))
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

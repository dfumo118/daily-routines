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
    
    @Binding var routine : RoutineModel
    @State var fieldText : String = ""
    @State var selectedColor : Color = .red
    
    var body: some View {
        VStack (alignment: .center, spacing:0){
            if editMode?.wrappedValue.isEditing == true {
                VStack {
                    TextField(routine.name, text: $fieldText)
                        .padding()
                        .onAppear {
                            fieldText = routine.name
                        }
                    ColorPicker("Change Routine Color", selection: $selectedColor, supportsOpacity: false)
                        .padding()
                        .onAppear {
                            selectedColor = Color(
                                red: routine.color[0],
                                green: routine.color[1],
                                blue: routine.color[2]
                            )
                        }
                }
            }
            if !routine.actions.isEmpty &&
                editMode!.wrappedValue.isEditing == false
            {
                NavigationLink(
                    destination: RoutineInteractView(routine: routine),
                    label: {
                        Text("Start - \(routine.timeAsSentence())")
                    }
                )
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(
                    red: routine.color[0],
                    green: routine.color[1],
                    blue: routine.color[2],
                    opacity: 0.7
                ))
                .foregroundColor(routine.color.reduce(0, +) > 2 ? .black : .white)
                .cornerRadius(10)
                
            }
            ActionListView(routine: $routine)
        }
        .padding()
        .navigationTitle(
            routine.name
        )
        .navigationBarItems (
            trailing: EditButton()
        )
        
        .onChange(of: editMode!.wrappedValue, perform: { value in
            if !value.isEditing {
                rLVM.changeName(routine: routine, name: fieldText)
                rLVM.changeColor(routine: routine, color: UIColor(selectedColor))
            }
        })
    }
}

struct RoutineEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
//            RoutineEditView(routine: RoutineModel(name:"hi", actions:[]))
        }.environmentObject(RoutineListViewModel())
    }
}

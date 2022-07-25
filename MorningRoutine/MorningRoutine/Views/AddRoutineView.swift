//
//  AddRoutineView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/8/22.
//

import SwiftUI

struct AddRoutineView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var routineListViewModel : RoutineListViewModel
    
    @State var titleText : String = ""
    @State var selectedColor : Color = .red
    @State var newRoutine : RoutineModel = RoutineModel(name: "routine", actions: [])
    
    var body: some View {
        VStack {
            TextField("Title", text: $titleText)
                .padding()
                .padding(.horizontal)
                .background(
                    Color(UIColor.secondarySystemBackground)
                )
                .cornerRadius(10)
        
            ColorPicker("Change Routine Color", selection: $selectedColor, supportsOpacity: false)
                .padding()
            
            ActionListView(num: 0)
                .scaledToFill()
            
            Text("Save")
                .padding()
                .padding(.horizontal)
                .background(Color.accentColor)
                .cornerRadius(10)
                .foregroundColor(.white)
                .onTapGesture {
                    routineListViewModel.addRoutine(
                        name: titleText,
                        color: UIColor(selectedColor),
                        actions: newRoutine.actions
                    )
                    presentationMode.wrappedValue.dismiss()
                }
        }
        .padding()
        .padding()
        .navigationTitle("Create Routine")
//        .navigationBarItems (
//            trailing: (
//                NavigationLink(
//                    destination:  AddActionView(actionListViewModel: ActionListViewModel(routine: newRoutine)),
//                    label: {
//                        Text("Add Action")
//                    })
//            )
//        )
    }
}

struct AddRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddRoutineView()
        }
        .environmentObject(RoutineListViewModel())
    }
}

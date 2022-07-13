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
    
    var body: some View {
        ScrollView {
            TextField("Title", text: $titleText)
                .padding()
                .padding(.horizontal)
                .background(
                    Color(UIColor.secondarySystemBackground)
                )
                .cornerRadius(10)
            ColorPicker("Change Routine Color", selection: $selectedColor, supportsOpacity: false)
                .padding()
            Text("Save")
                .padding()
                .padding(.horizontal)
                .background(Color.accentColor)
                .cornerRadius(10)
                .foregroundColor(.white)
                .onTapGesture {
                    routineListViewModel.addRoutine(name: titleText, color: UIColor(selectedColor))
                    presentationMode.wrappedValue.dismiss()
                }
        }
        .padding()
        .navigationTitle("Create Routine")
        .navigationBarItems (
            trailing: (
                NavigationLink(
                    destination: Text("Add"), //AddActionView(actionListViewModel: nil),
                    label: {
                        Text("Add Action")
                    })
            )
        )
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

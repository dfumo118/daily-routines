//
//  AddRoutineView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/8/22.
//

import SwiftUI

struct AddRoutineView: View {
    @State var titleText : String = ""
    
    var body: some View {
        ScrollView {
            TextField("Title", text: $titleText)
                .padding()
                .padding(.horizontal)
                .background(
                    Color(UIColor.secondarySystemBackground)
                )
                .cornerRadius(10)
            // ListView(type: .actn)
        }
        .padding()
        .navigationTitle("Create Routine")
        .navigationBarItems (
            trailing: (
                NavigationLink(
                    destination: AddActionView(),
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
    }
}

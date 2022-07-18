//
//  RoutineEditView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/17/22.
//

import SwiftUI

struct RoutineEditView: View {
    
    @State var routine : RoutineModel
    
    var body: some View {
        VStack {
            if !routine.actions.isEmpty {
                NavigationLink(
                    destination: RoutineInteractView(routine: routine),
                    label: { Text("Start") }
                )
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(
                    red: routine.color[0],
                    green: routine.color[1],
                    blue: routine.color[2],
                    opacity: 0.7
                ))
                .foregroundColor(.white)
                .cornerRadius(10)
                
            }
            ActionListView(routine: routine)
        }
        .padding()
        .navigationTitle(
            routine.name
        )
    }
}

struct RoutineEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoutineEditView(routine: RoutineModel(name: "Routine 1", color: [0,0.5,0.5],
                                                  actions: [ActionModel(title: "One", time: 3)]))
        }
    }
}

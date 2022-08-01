//
//  RoutineListRowView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/12/22.
//

import SwiftUI

struct RoutineListRowView: View {
    
    @Binding var routine: RoutineModel
    @State var selected: Bool = false
    
    var body: some View {
        ZStack {
            HStack {
                Text(routine.name)
                Spacer()
                Text(routine.timeAsString())
            }
            NavigationLink(
                destination: RoutineEditView(routine: routine),
                label : {
                    Text("")
                }
            )
        }
        .buttonStyle(.plain)
        .padding(20)
        .background(Color(red: routine.color[0],
                          green: routine.color[1],
                          blue: routine.color[2],
                          opacity: 0.7))
        .foregroundColor(routine.color.reduce(0, +) > 2 ? .black : .white)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct RoutineListRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
//            RoutineListRowView(
//                                routine: RoutineModel(name:"Hi", actions:[]))
        }
    }
}

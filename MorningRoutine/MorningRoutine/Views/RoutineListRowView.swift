//
//  RoutineListRowView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/12/22.
//

import SwiftUI

struct RoutineListRowView: View {
    @State var routine: RoutineModel
    @State var selected: Bool = false
    
    var body: some View {
        HStack {
            Text(routine.name)
            Spacer()
            Text(routine.timeAsString())
        }
        .padding(20)
        .background(Color(red: routine.color[0],
                          green: routine.color[1],
                          blue: routine.color[2],
                          opacity: 0.7))
        .foregroundColor(routine.color.reduce(0, +) < 255 ? .black : .white)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct RoutineListRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        RoutineListRowView(routine: RoutineModel(name: "R2", actions:[ActionModel(title: "Action", time: 10)]))
        
    }
}

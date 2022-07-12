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
        VStack {
            HStack {
                Text(routine.name)
                Spacer()
                Text(routine.timeAsString())
            }
            if selected {
                HStack {
                    Text("Edit")
                        .padding()
                        .padding(.horizontal,20)
                        .background(.black)
                        .cornerRadius(10)
                        .onTapGesture {
                            selected = true
                        }
                    Text("Start")
                        .padding()
                        .padding(.horizontal,20)
                        .background(.blue)
                        .cornerRadius(10)
                        .onTapGesture {
                            selected = true
                        }
                }
            }
        }
        .padding(20)
        .background(Color(red: routine.color[0],
                          green: routine.color[1],
                          blue: routine.color[2],
                          opacity: 0.7))
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding(.horizontal)
        .onTapGesture {
            if true {
                withAnimation(.spring()) {
                    selected.toggle()
                }
            }
        }
    }
}

struct RoutineListRowView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineListRowView(routine: RoutineModel(name: "R2", actions:[]))
    }
}

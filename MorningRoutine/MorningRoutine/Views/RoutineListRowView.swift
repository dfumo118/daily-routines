//
//  RoutineListRowView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/12/22.
//

import SwiftUI

struct RoutineListRowView: View {
    @EnvironmentObject var rLVM : RoutineListViewModel
    
    @State var num: Int
    @State var selected: Bool = false
   
    
    var body: some View {
        ZStack {
            HStack {
                Text(rLVM.routines[num].name)
                Spacer()
                Text(rLVM.routines[num].timeAsString())
            }
            NavigationLink(
                destination: RoutineEditView(num: num),
                label : {
                    Text("")
                }
            )
        }
        .buttonStyle(.plain)
        .padding(20)
        .background(Color(red: rLVM.routines[num].color[0],
                          green: rLVM.routines[num].color[1],
                          blue: rLVM.routines[num].color[2],
                          opacity: 0.7))
        .foregroundColor(rLVM.routines[num].color.reduce(0, +) < 255 ? .black : .white)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct RoutineListRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoutineListRowView(num:0)
        }
        .environmentObject(RoutineListViewModel())
    }
}

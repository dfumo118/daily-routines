//
//  RoutineInteractView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/15/22.
//

import SwiftUI

struct RoutineInteractView: View {
    @State var tap : Bool = false
    @State var held : Bool = false
    @State var transferring : Bool = false
    @State var routine : RoutineModel
    @State var num : Int = 0
    @State var time : Int
    
    init(routine: RoutineModel) {
        self.routine = routine
        self.time = routine.actions[0].time
    }
    
    
    let maxHeight = sqrt(
        UIScreen.main.bounds.height * UIScreen.main.bounds.height +
        UIScreen.main.bounds.width * UIScreen.main.bounds.width
    )
    
    var body: some View {
        ZStack {
            if time <= 0 {
                Color.red
                    .ignoresSafeArea()
                    .frame(width: .infinity, height: .infinity)
                    .animation(.linear, value: held)
            }
            VStack {
                Text(routine.actions[num].title)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .animation(.spring(), value: num)
                    .frame(
                        width: tap ? maxHeight : 200,
                        height: tap ? maxHeight : 200
                    )
                    .background(
                        Circle()
                            .strokeBorder(time <= 0 ?
                                .white : .white.opacity(0), lineWidth:2)
                            .background(Circle().fill(
                                time <= 0 ?
                                    Color.red
                                    :
                                held ?
                                    Color.green.opacity(0.7) :
                                    Color(red:routine.color[0],
                                          green: routine.color[1],
                                          blue: routine.color[2],
                                          opacity: 0.7)))
                            
                    )
                    .onLongPressGesture (minimumDuration: 3,
                                         maximumDistance: .infinity) {
                        (isPressing) in
                        if isPressing {
                            withAnimation(.easeInOut(duration:3)) {
                                tap = true
                            }
                        }
                        else {
                            DispatchQueue.main.asyncAfter(
                                deadline: .now()+0.1) {
                                    if !held {
                                        withAnimation(.easeInOut) {
                                            tap = false
                                        }
                                    }
                                }
                        }
                    } perform : {
                        withAnimation(.easeInOut) {
                            held = true
                            transferring = true
                        }
                        DispatchQueue.main.asyncAfter(
                            deadline: .now()+1) {
                                withAnimation(.spring(
                                    response:0.75,
                                    dampingFraction: 0.4)
                                ) {
                                    held = false
                                    tap = false
                                }
                                
                            }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            if num < routine.actions.count - 1 {
                                num = num + 1
                                time = routine.actions[num].time
                                transferring = false
                            }
                            else if num == routine.actions.count - 1 {
                                num = 0
                                time = routine.actions[num].time
                                transferring = false

                            }
                        }
                    }
            }
            TimerView(time: $time)
                .opacity(tap || transferring ? 0 : 1)
                .animation(.spring(), value: transferring)
                
        }
        .toolbar(.hidden)
    }
}

struct RoutineInteractView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoutineInteractView(routine:
                                    RoutineModel(
                                        name: "R1",
                                        color: [0,0.5,0.5],
                                        actions: [
                                            ActionModel(title:"A1", time: 3),
                                            ActionModel(title:"A2", time: 3),
                                            ActionModel(title:"A3", time: 150),
                                        ]))
        }
    }
}

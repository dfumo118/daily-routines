//
//  RoutineInteractView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/15/22.
//

import SwiftUI

struct RoutineInteractView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var routine : RoutineModel
    
    @State var tap : Bool = false
    @State var held : Bool = false
    @State var transferring : Bool = false
    @State var holdTime : Bool = false
    @State var finished : Bool = false
   
    @State var num : Int = 0
    @State var time : Int = 0
    
    
    let maxHeight = sqrt(
        UIScreen.main.bounds.height * UIScreen.main.bounds.height +
        UIScreen.main.bounds.width * UIScreen.main.bounds.width
    )
    
    var body: some View {
       
        ZStack {
            if finished {
                Color.green
                    .ignoresSafeArea()
            }
            else if time <= 0 {
                Color.red
                    .ignoresSafeArea()
            }
            
            VStack {
                Text(finished ?
                     "\(routine.name) complete!"
                     : routine.actions[num].title)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .animation(.spring(), value: num)
                    .frame(
                        width: tap ? maxHeight : 200,
                        height: tap ? maxHeight : 200
                    )
                    .background(
                        Circle()
                            .strokeBorder(finished || time <= 0 ?
                                .white : .white.opacity(0), lineWidth:2)
                            .background(Circle().fill(
                                held || finished ?
                                Color.green
                                :
                                    time <= 0 ?
                                Color.red :
                                    Color(red:routine.color[0],
                                          green: routine.color[1],
                                          blue: routine.color[2],
                                          opacity: 0.7)))
                        
                    )
                    .onLongPressGesture (minimumDuration: 3,
                                         maximumDistance: .infinity) {
                        (isPressing) in
                        if isPressing && !finished {
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
                            holdTime = true
                        }
                        DispatchQueue.main.asyncAfter(
                            deadline: .now()+1) {
                                withAnimation(.spring(
                                    response:0.75,
                                    dampingFraction: 0.4)
                                ) {
                                    held = false
                                    tap = false
                                    holdTime = false
                                    time = 10
                                }
                                
                            }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            if num < routine.actions.count - 1 {
                                num += 1
                            }
                            else {
                                withAnimation(.easeInOut) {
                                    finished = true
                                }
                                holdTime = true
                            }
                            time = routine.actions[num].time
                            transferring = false
                        }
                    }
            }
            TimerView(time: $time, hold: $holdTime)
                .opacity(finished || tap || transferring ? 0 : 1)
                .animation(.spring(), value: transferring)
            VStack {
                Spacer()
                Text("Back")
                    .padding()
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 2)
                            .background(
                                RoundedRectangle(cornerRadius: 10).fill(.black.opacity(
                                    time <= 0 || finished ? 0 : 1
                                ))
                            )
                    )
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .opacity(tap || transferring ? 0 : 1)
            }
            
        }
        .toolbar(.hidden)
        .onAppear {
            time = routine.actions[0].time
        }
    }
}

struct RoutineInteractView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoutineInteractView(routine:
                                    RoutineModel(
                                        name: "R1",
                                        actions: [
                                            ActionModel(title:"A1", time: 3),
//                                            ActionModel(title:"A2", time: 3),
//                                            ActionModel(title:"A3", time: 150),
                                        ],
                                        color: [0,0.5,0.5]))
        }
    }
}

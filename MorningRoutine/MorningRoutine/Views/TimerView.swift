//
//  TimerView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/15/22.
//

import SwiftUI

struct TimerView: View {
    
    let timer = Timer.publish(every: 1,
                                      on: .main,
                                      in: .common).autoconnect()
    @State var time : Int
    @State var timerRunning : Bool = true
    
    func secondsToTime(seconds: Int) -> String {
        let minutes = seconds / 60
        let sec = seconds % 60
        return String(format:"%02i:%02i", minutes, sec)
    }
    
    var body: some View {
        VStack {
            Text(secondsToTime(seconds: time))
                .padding()
                .font(.system(size: 60))
                .onReceive(timer) { value in
                    if time > 0 && timerRunning {
                        time -= 1
                    }
                }
            Spacer()
        }
    }
    
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(time: 120)
    }
}

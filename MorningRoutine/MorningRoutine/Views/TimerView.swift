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
    @Binding var time : Int
    @State var timerRunning : Bool = true
    
    func secondsToTime(seconds: Int) -> String {
        let abs = abs(seconds)
        let minutes = abs / 60
        let sec = abs % 60
        return String(format:"%02i:%02i", minutes, sec)
    }
    
    var body: some View {
        VStack {
            Text(secondsToTime(seconds: time))
                .padding()
                .font(.system(size: 60))
                .onReceive(timer) { value in
                    if timerRunning {
                        time -= 1
                    }
                }
                .foregroundColor(time <= 0 ? .white : Color.primary)
            Spacer()
        }
    }
    
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        Text("timer")
    }
}

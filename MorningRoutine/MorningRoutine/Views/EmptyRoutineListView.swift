//
//  EmptyListView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/14/22.
//

import SwiftUI

struct EmptyRoutineListView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: UIScreen.main.bounds.width - 20)
            VStack {
                Text("No routines!")
                    .font(.title)
                    .padding(.vertical, 5)
                Text("Create a new routine and make your day productive!")
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
            .foregroundColor(.white)
            
        }
    }
}

struct EmptyRoutineListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyRoutineListView()
    }
}

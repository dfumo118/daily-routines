//
//  EmptyActionListView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/14/22.
//

import SwiftUI

struct EmptyActionListView: View {
    @State var title : String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(UIColor.secondarySystemBackground))
                .frame(width:UIScreen.main.bounds.width - 20)
            VStack {
                Text("no actions!")
                    .font(.title)
                    .padding(.vertical, 5)
                Text("add actions to \(title) to start working!")
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct EmptyActionListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyActionListView(title: "Routine 1")
    }
}

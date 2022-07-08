//
//  AddView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/6/22.
//

import SwiftUI

struct AddActionView: View {
    @State var titleText : String = ""
    @State var timeText : String = ""
    
    var body: some View {
        VStack {
            TextField("Title", text: $titleText)
                .padding()
                .padding(.horizontal)
                .background(
                    Color(UIColor.secondarySystemBackground)
                )
                .cornerRadius(10)
            TextField("Text", text: $timeText)
                .padding()
                .padding(.horizontal)
                .background(
                    Color(UIColor.secondarySystemBackground)
                )
                .cornerRadius(10)
            Text("Add")
                .padding()
                .padding(.horizontal, 20)
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(Color.white)
                .onTapGesture {
                    //
                }
            Spacer()
        }
        .padding(20)
        .navigationTitle("Add Action")
    }
}

struct AddActionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddActionView()
        }
    }
}

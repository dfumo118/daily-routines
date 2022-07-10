//
//  AddView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/6/22.
//

import SwiftUI

struct AddActionView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var actionListViewModel : ActionListViewModel
    @State var titleText : String = ""
    @State var minutes : Int = 0
    @State var seconds : Int = 0
    
    var body: some View {
        VStack {
            TextField("Title", text: $titleText)
                .padding()
                .padding(.horizontal)
                .background(
                    Color(UIColor.secondarySystemBackground)
                )
                .cornerRadius(10)
            HStack {
                VStack {
                    Text("Minutes")
                        .padding(.vertical, 2)
                    Picker(selection: $minutes, label: Text("Minutes")) {
                        ForEach(0..<60, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(minWidth:0)
                    .clipped()
                    .background(
                        Color(UIColor.secondarySystemBackground)
                    )
                    .cornerRadius(10)
                }
                VStack {
                    Text("Seconds")
                        .padding(.vertical, 2)
                    Picker(selection: $seconds, label: Text("Seconds")) {
                        ForEach(0..<60, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(minWidth:0)
                    .clipped()
                    .background(
                        Color(UIColor.secondarySystemBackground)
                    )
                    .cornerRadius(10)
                }
            }
            .padding(.vertical, 10)
            Text("Add")
                .padding()
                .padding(.horizontal, 20)
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(Color.white)
                .onTapGesture {
                    buttonPressed()
                }
                .padding()
            Spacer()
        }
        .padding(20)
        .navigationTitle("Add Action")
    }
    
    func buttonPressed() {
        actionListViewModel.addAction(
            title: titleText,
            time: minutes * 60 + seconds
        )
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddActionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddActionView()
        }
    }
}

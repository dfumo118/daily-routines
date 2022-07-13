//
//  ListRowView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/5/22.
//

import SwiftUI

struct ActionListRowView: View {
  
    @State var action : ActionModel
    @State var editing : Bool = false
    @State var titleText : String = ""
    @State var minutes : Int = 0
    @State var seconds : Int = 0
    
    var body: some View {
        VStack{
            if editing {
                VStack {
                    HStack {
                        TextField("\(action.title)", text: $titleText)
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
                    Text("Save")
                        .padding()
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.spring(response:0.2)) {
                                editing = false
                            }
                        }
                }
            }
            else {
                HStack {
                    Text(action.title)
                    Spacer()
                    Text(action.timeAsString())
                }
            }
        }
        .padding(20)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
        .padding(.horizontal)
        .onTapGesture {
            if !editing {
                withAnimation(.spring()) {
                    editing.toggle()
                }
            }
        }
        .onAppear {
            titleText = action.title
            minutes = action.time / 60
            seconds = action.time % 60
        }
    }
}

struct ActionListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ActionListRowView(action: ActionModel(title:"Hi", time: 300))
    }
}
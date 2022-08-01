//
//  AddRoutineView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/8/22.
//

import SwiftUI

struct AddRoutineView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var rLVM : RoutineListViewModel
    
    @State var titleText : String = ""
    @State var selectedColor : Color = .red
    
    var body: some View {
        VStack {
            TextField("title", text: $titleText)
                .padding()
                .padding(.horizontal)
                .background(
                    Color(UIColor.secondarySystemBackground)
                )
                .cornerRadius(10)
        
            ColorPicker("change routine color", selection: $selectedColor, supportsOpacity: false)
                .padding()
    
            Text("save")
                .padding()
                .padding(.horizontal)
                .background(selectedColor.opacity(0.7))
                .cornerRadius(10)
                .foregroundColor(rLVM.getRGB(color: UIColor(selectedColor)).reduce(0, +) > 2 ? .black : .white)
                .onTapGesture {
                    rLVM.addRoutine(
                        name: titleText.lowercased(),
                        color: UIColor(selectedColor),
                        actions: []
                    )
                    presentationMode.wrappedValue.dismiss()
                }
            Spacer()
        }
        .padding()
        .padding()
        .navigationTitle("create routine.")
    }
}

struct AddRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddRoutineView()
        }
        .environmentObject(RoutineListViewModel())
    }
}

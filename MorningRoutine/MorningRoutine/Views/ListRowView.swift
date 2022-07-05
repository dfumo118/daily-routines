//
//  ListRowView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/5/22.
//

import SwiftUI

struct ListRowView: View {
    @State var text : String
    
    var body: some View {
        HStack {
            Text(text)
            Spacer()
            Text("05:00")
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(text:"Hi")
    }
}

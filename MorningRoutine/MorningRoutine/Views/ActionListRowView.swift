//
//  ListRowView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/5/22.
//

import SwiftUI

struct ActionListRowView: View {
    @State var action : ActionModel
    
    var body: some View {
        HStack {
            Text(action.title)
            Spacer()
            Text(action.timeAsString())
        }
    }
}

struct ActionListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ActionListRowView(action: ActionModel(title:"Hi", time: 300))
    }
}

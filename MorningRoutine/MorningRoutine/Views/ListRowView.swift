//
//  ListRowView.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/5/22.
//

import SwiftUI

struct ListRowView: View {
    @State var item : ItemModel
    
    var body: some View {
        HStack {
            Text(item.title)
            Spacer()
            Text(item.timeAsString())
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(item: ItemModel(title:"Hi", time: 300))
    }
}

//
//  ListViewModel.swift
//  MorningRoutine
//
//  Created by David Fumagalli on 7/8/22.
//

import Foundation

class ListViewModel : ObservableObject {
    @Published var items : [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "Hi", time: 120),
            ItemModel(title: "Hello", time: 150),
            ItemModel(title: "Hey there", time: 100)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String, time: Int) {
        let newItem = ItemModel(title: title, time: time)
        items.append(newItem)
    }
}

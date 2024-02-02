//
//  ToDosViewModel.swift
//  ToDoList
//
//  Created by Giacomo on 02/02/24.
//

import Foundation

class ToDosViewModel: ObservableObject {
    @Published var toDos: [ToDo] = []
    
    init() {
        // Temp data here. Will eventually load in saved data
        toDos.append(ToDo(id: UUID().uuidString, item: "Learn Swift"))
        toDos.append(ToDo(id: UUID().uuidString, item: "Build Apps"))
        toDos.append(ToDo(id: UUID().uuidString, item: "Change the World!"))
    }
    
    func saveToDo(toDo: ToDo) {
        if toDo.id == nil { // new
            var newToDo = toDo
            newToDo.id = UUID().uuidString
            toDos.append(newToDo)
        } else { // update exisiting one
            if let index = toDos.firstIndex(where: { $0.id == toDo.id }) {
                toDos[index] = toDo
            }
        }
    }
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
    }
    
    func moveToDo(indices: IndexSet, newOffset: Int) {
        toDos.move(fromOffsets: indices, toOffset: newOffset)
    }
}

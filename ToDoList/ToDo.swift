//
//  ToDo.swift
//  ToDoList
//
//  Created by Giacomo on 02/02/24.
//

import Foundation

struct ToDo: Identifiable {
    var id: String?
    var item = ""
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)
    var notes = ""
    var isCompleted = false
}

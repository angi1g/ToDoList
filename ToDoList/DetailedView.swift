//
//  DetailedView.swift
//  ToDoList
//
//  Created by Giacomo on 30/01/2024.
//

import SwiftUI

struct DetailedView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var toDosVM: ToDosViewModel
    @State var toDo: ToDo // non può essere private
    
    var body: some View {
        
        List {
            TextField("Enter To Do here", text: $toDo.item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            
            Toggle("Set Reminder:", isOn: $toDo.reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            DatePicker("Date", selection: $toDo.dueDate)
                .listRowSeparator(.hidden)
                .padding(.bottom)
                .disabled(!toDo.reminderIsOn)
            
            Text("Notes:")
                .padding(.top)
            TextField("Notes", text: $toDo.notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            
            Toggle("Completed:", isOn: $toDo.isCompleted)
                .padding(.top)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    toDosVM.saveToDo(toDo: toDo)
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailedView(toDo: ToDo())
                .environmentObject(ToDosViewModel())
        }
    }
}

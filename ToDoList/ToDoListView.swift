//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Giacomo on 30/01/2024.
//

import SwiftUI

struct ToDoListView: View {
    @State private var sheetIsPresented = false
    @EnvironmentObject private var toDosVM: ToDosViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDosVM.toDos) { toDo in
                    NavigationLink {
                        DetailedView(toDo: toDo)
                    } label: {
                        Text(toDo.item)
                    }
                    .font(.title2)
                }
                .onDelete(perform: toDosVM.deleteToDo) // short
                .onMove(perform: toDosVM.moveToDo) // short
                /* TRADITIONAL
                .onDelete(perform: { indexSet in
                    toDosVM.delete(indexSet: indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    toDosVM.move(indices: indices, newOffset: newOffset)
                })
                */
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $sheetIsPresented) {
            //.fullScreenCover(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailedView(toDo: ToDo())
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
            .environmentObject(ToDosViewModel())
    }
}



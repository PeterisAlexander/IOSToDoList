//
//  ToDoListItemsView.swift
//  IOSToDoList
//
//  Created by Pierre Alexandre D. on 24/08/2024.
//
import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) {item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Image(systemName: "trash")
                                    .tint(Color.red)
                            }
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "hbEIJHwxjiMV8Zx6yp0q4kc3RTG2")
}

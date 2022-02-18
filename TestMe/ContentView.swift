//
//  ContentView.swift
//  TestMe
//
//  Created by Derek Bronston on 2/8/22.
//

import SwiftUI


class ViewModel: ObservableObject {
    @Published var me = "yo"
    
    func tell(str: String) {
        me = str
    }
}

public struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    public var body: some View {
        Text(viewModel.me)
            .padding()
        Button(action: {
            self.viewModel.tell(str: "hello")
        }) {
            Label("Add Folder", systemImage: "folder.badge.plus")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


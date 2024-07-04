//
//  ContentView.swift
//  MynanceSwiftUI
//
//  Created by Sai Bommakanti on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                // save
                print("Print was pressed")
            } label: {
                Text("Save Button")
            }
                           
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

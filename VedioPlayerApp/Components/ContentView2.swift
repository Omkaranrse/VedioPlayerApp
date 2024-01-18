//
//  ContentView.swift
//  VedioPlayerApp
//
//  Created by Omkar Anarse on 18/01/24.
//

import SwiftUI

struct ContentView2: View {
    
    @State var query : Query = .animals
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("", selection: $query) {
                    ForEach(Query.allCases, id: \.rawValue) {
                        Text($0.rawValue)
                            .tag($0)
                    }
                }
                .labelsHidden()
                .pickerStyle(.segmented)
                .onChange(of: query, initial: true) { oldValue, newValue in
                    //Updating status bar style
                    UIApplication.shared.setStatusBarStyle(newValue.statusBarStyle)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView2()
}

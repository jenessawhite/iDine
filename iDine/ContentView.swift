//
//  ContentView.swift
//  iDine
//
//  Created by Jenessa White on 2/10/20.
//  Copyright © 2020 Jenessa White. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Text(section.name)
                        .font(.headline)
                    ForEach(section.items) { item in
                        Text(item.name).font(.subheadline)
                    }
                }
            }
        .navigationBarTitle("Our Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

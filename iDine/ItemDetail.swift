//
//  ItemDetail.swift
//  iDine
//
//  Created by Jenessa White on 2/15/20.
//  Copyright © 2020 Jenessa White. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    var item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(5)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -10, y: -5)
            }
            
            Text(item.description)
                .fontWeight(.light)
                .padding(20.0)
            Spacer()
            
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ItemDetail(item: MenuItem.example)
        }
    }
}

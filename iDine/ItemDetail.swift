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
            Image(item.mainImage)
            Text(item.description).fontWeight(.light)
        }
        .navigationBarTitle(item.name)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: MenuItem.example)
    }
}

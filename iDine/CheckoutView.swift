//
//  CheckoutView.swift
//  iDine
//
//  Created by Jenessa White on 2/17/20.
//  Copyright © 2020 Jenessa White. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash on Delivery", "Card", "iDine Points"]
    static let tipAmounts = [10,15,20,25,0]
    
    @State private var paymentType = 0
    @State private var tipAmount = 1
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var showingPaymentAlert = false
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section {
                Picker("Payment Option?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails) {
                    Text("Add Loyalty Details")
                }
                if addLoyaltyDetails {
                    TextField("Loyalty Number", text:$loyaltyNumber)
                }
            }
            
            Section(header:
                Text("TOTAL: $\(totalPrice, specifier: "%.2f")")
                    .font(.headline)
            ) {
                Button("Confirm order") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .alert(isPresented: $showingPaymentAlert) {
            Alert(
                title: Text("Order confirmed"),
                message: Text("Your total was $\(totalPrice, specifier: "%.2f") – thank you!"),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}

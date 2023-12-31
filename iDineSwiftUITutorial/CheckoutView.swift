//
//  CheckoutView.swift
//  iDineSwiftUITutorial
//
//  Created by Umut Barış Çoşkun on 20.08.2023.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    
    let paymentTypes = ["Cash", "Credit Card", "Points"]
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetailts = false
    @State private var loyaltyNumber = ""
    
    @State private var showingPaymentAlert = false
    
    
    let tipAmounts = [10,15,20,25,0]
    @State private var tipAmount = 15
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self){
                        Text($0)
                        
                    }
                }
                Toggle("Add loyalty card", isOn: $addLoyaltyDetailts.animation())
                if addLoyaltyDetailts {
                    TextField("Enter your ID", text: $loyaltyNumber)
                }
                
                 
            }
            
            Section("Add a tip?"){
                Picker("Percentage: ", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self){
                        Text("\($0)%")
                        
                    }
                }.pickerStyle(.segmented)
            }
            
            Section("Total \(totalPrice)"){
                Button("Confirm Order"){
                    showingPaymentAlert.toggle()
                }
            }
            
           
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order Confirmed",isPresented: $showingPaymentAlert){
            // add button here
        } message: {
            Text("Your total was: \(totalPrice) - Thank you!")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}

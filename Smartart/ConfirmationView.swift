//
//  ConfirmationView.swift
//  Smartart
//
//  Created by Arefeh Bakhshayesh on 09/11/25.
//

import SwiftUI

struct ConfirmationView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            ReminderColors.background
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                Text("Reminder saved!")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                
                Text("You will be reminded to draw.")
                    .font(.system(size: 16))
                    .foregroundColor(ReminderColors.card)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                // Cream rectangle with "Done"
                Button {
                    dismiss()           // go back to previous screen
                } label: {
                    Text("Done")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(ReminderColors.background)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 40)
                        .background(ReminderColors.card)
                        .cornerRadius(18)
                }
                .buttonStyle(.plain)
                .padding(.top, 16)
            }
            .padding()
        }
        .navigationTitle("Done")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)   // hide system back button
    }
}

// Preview
struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ConfirmationView()
        }
        .previewDevice("iPhone 17 Pro")
    }
}

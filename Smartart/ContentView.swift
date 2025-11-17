import SwiftUI

struct ContentView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var titleText: String = ""
    @State private var notesText: String = ""
    
    var body: some View {
        ZStack {
            ReminderColors.background
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 32) {
                    
                    // Form fields
                    VStack(alignment: .leading, spacing: 24) {
                        
                        // Title
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Title")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                            
                            TextField("Set a reminder…", text: $titleText)
                                .textFieldStyle(.plain)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 18)
                                .background(ReminderColors.card)
                                .cornerRadius(18)
                        }
                        
                        // Date
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Date")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                            
                            HStack {
                                Image(systemName: "calendar")
                                Text("Nov 03, 2025")
                                Spacer()
                            }
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 18)
                            .background(ReminderColors.card)
                            .cornerRadius(18)
                        }
                        
                        // Time
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Time")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                            
                            HStack {
                                Image(systemName: "clock")
                                Text("09:41")
                                Spacer()
                            }
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 18)
                            .background(ReminderColors.card)
                            .cornerRadius(18)
                        }
                        
                        // Description
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Description")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                            
                            TextField("Add notes", text: $notesText)
                                .textFieldStyle(.plain)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 18)
                                .background(ReminderColors.card)
                                .cornerRadius(18)
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                    
                    // Save button -> ConfirmationView
                    NavigationLink {
                        ConfirmationView()
                    } label: {
                        VStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(ReminderColors.card)
                                    .frame(width: 110, height: 110)
                                
                                Image(systemName: "paintbrush.pointed.fill")
                                    .font(.system(size: 42, weight: .medium))
                                    .foregroundColor(ReminderColors.background)
                            }
                            
                            Text("Save")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(ReminderColors.card)
                        }
                    }
                    .buttonStyle(.plain)
                    .padding(.bottom, 40)
                }
            }
        }
        .navigationTitle("Reminder")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()         // go back to HomeView
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                        Text("Art Stories")
                    }
                    .font(.system(size: 17))
                    .foregroundColor(ReminderColors.card)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "alarm.fill")
                    .font(.system(size: 22))
                    .foregroundColor(ReminderColors.accent)
            }
        }
    }
}

// MARK: - Color palette

struct ReminderColors {
    static let background = Color(red: 47.0/255.0,
                                  green: 34.0/255.0,
                                  blue: 32.0/255.0)
    
    static let card = Color(red: 244.0/255.0,
                            green: 231.0/255.0,
                            blue: 208.0/255.0)
    
    static let accent = Color(red: 242.0/255.0,
                              green: 142.0/255.0,
                              blue: 73.0/255.0)
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
        .previewDevice("iPhone 17 Pro")
    }
}

import SwiftUI

struct HomeView: View {
    
    @State private var isMenuOpen: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .leading) {
                
                // Full-screen background image
                Image("background")   // Add this image to Assets later
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // Top bar with hamburger icon
                VStack {
                    HStack {
                        Button {
                            withAnimation(.easeInOut) {
                                isMenuOpen = true
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .font(.system(size: 22, weight: .medium))
                                .foregroundColor(Color(red: 242/255, green: 142/255, blue: 73/255)) // 🔸 orange

                                .padding(10)
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 32)
                    
                    Spacer()
                }
                
                // Overlay + Side menu
                if isMenuOpen {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                isMenuOpen = false
                            }
                        }
                    
                    SideMenuView(isShowing: $isMenuOpen)
                        .transition(.move(edge: .leading))
                }
            }
        }
    }
}

// MARK: - Side Menu

struct SideMenuView: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 24) {
                
                // Close (X) button
                HStack {
                    Spacer()
                    Button {
                        withAnimation(.easeInOut) {
                            isShowing = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                }
                
                // Menu items
                MenuRow(icon: "lock", title: "Unlock Smart Art")
                MenuRow(icon: "square.and.pencil", title: "Contact us")
                MenuRow(icon: "star", title: "Rate & Review")
                MenuRow(icon: "bell", title: "Push notifications")
                MenuRow(icon: "square.and.arrow.up", title: "Share Smart Art app")
                MenuRow(icon: "info.circle", title: "About")
                
                // Reminder item -> navigates to ContentView
                NavigationLink {
                    ContentView()
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "alarm")
                            .font(.system(size: 18))
                        Text("Reminder")
                            .font(.system(size: 16))
                        Spacer()
                    }
                    .foregroundColor(.black)
                }
                
                Spacer()
            }
            .padding(20)
        }
        .frame(width: 300)
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .padding(.top, 40)
    }
}

// MARK: - Menu Row

struct MenuRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 18))
            Text(title)
                .font(.system(size: 16))
            Spacer()
        }
        .foregroundColor(.black)
    }
}

// MARK: - Preview

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 17 Pro")
    }
}

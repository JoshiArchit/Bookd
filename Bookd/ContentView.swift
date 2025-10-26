//
//  ContentView.swift
//  Bookd
//
//  Created by Archit Joshi on 10/25/25.
//

import SwiftUI

// TODO : Styles need to be updated. Test for iPad. Mac is last priority.
struct ContentView: View {
    // If its not readingListTab its wishListTab
    @State private var tab: Tab = .reading;
    
    var body: some View {
        NavigationStack{
            VStack{
                // Tabs for Reading List and Wishlist
                HStack {
                    Spacer()
                    TabButton("Reading list", isSelected: tab == .reading) {tab = .reading}
                    Spacer()
                    TabButton("Wishlist", isSelected: tab == .wishlist) { tab = .wishlist}
                    Spacer()
                }
                
                Divider()
                
                // Views for each tab
                Group {
                    switch tab {
                        case .reading:
                            ReadingListTab()
                        case .wishlist:
                            WishlistTab()
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Bookd")
            .navigationSubtitle("Your book diary")
            
  
        }
    }
}

// TODO : Externalize Views. Move to seperate project files.
struct TabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    init(_ title: String, isSelected: Bool, action:  @escaping () -> Void) {
        self.title = title
        self.isSelected = isSelected
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.callout.weight(.semibold))
                .padding(.vertical, 8)
                .padding(.horizontal, 14)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isSelected ? Color.accentColor.opacity(0.2) : .clear)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? Color.accentColor : Color.secondary.opacity(0.3), lineWidth: 1)
                }
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }
}

struct ReadingListTab: View {
    let books = ["Book1", "Book2", "Book3"]
    
    // TODO : Externalize booklist. Needs to be an input
    var body: some View {
        List(books, id: \.self) { book in
            Label(book, systemImage: "book.fill")
        }
    }
}

struct WishlistTab: View {
    let books = ["Book4", "Book5", "Book6"]
    
    // TODO : Externalize booklist. Needs to be an input.
    var body: some View {
        List(books, id: \.self) { book in
            Label(book, systemImage: "book.fill")
        }
    }
}


enum Tab{
    case reading, wishlist
}

#Preview {
    ContentView()
}

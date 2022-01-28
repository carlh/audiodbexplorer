//
//  ContentView.swift
//  AudioDBExplorer
//
//  Created by Carl Hinkle on 1/26/22.
//

import SwiftUI



struct ContentView: View {
    @State private var searchValue: String = ""
    @State private var artists: Artists?
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    private func performSearch() {
        Task {
            artists = await AudioDBAPI.search(for: searchValue)
        }
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    TextField("Enter name of artist", text: $searchValue)
                        .keyboardType(UIKeyboardType.alphabet)
                        .submitLabel(SubmitLabel.search)
                        .onSubmit {
                            performSearch()
                        }
                    Button {
                        performSearch()
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
                .padding()
                .background(
                    Capsule()
                        .stroke()
                        .foregroundColor(Color(uiColor: .lightGray))
                )
                .padding()
                
                Spacer(minLength: 16)
                List {
                    // From what I can tell you only get back a single artist no matter what you search for, and it only does an exact match.  Still putting it in a list because it looks like the API should support a list (maybe it's a free API limitation?
                    // I also want to put the artist details on another page.
                    ForEach(artists?.artists ?? []) { artist in
                        withAnimation {
                            NavigationLink(artist.strArtist ?? "Unknown Artist") {
                                ArtistDetail(artist: artist)
                                    .navigationTitle("Artist Detail")
                            }
                        }
                        
                    }
                }
            }
            .onChange(of: searchValue, perform: { newValue in
                if newValue == "" {
                    artists = nil
                }
            })
            .navigationTitle("Search for an artist")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

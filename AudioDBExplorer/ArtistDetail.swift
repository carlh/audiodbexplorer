//
//  ArtistDetail.swift
//  AudioDBExplorer
//
//  Created by Carl Hinkle on 1/27/22.
//

import SwiftUI

struct ArtistDetail: View {
    let artist: Artists.Artist
    
    var body: some View {
        VStack(spacing: 24) {
            AsyncImage(url: URL(string: artist.strArtistThumb ?? "") ?? nil) { image in
                image
                    .resizable()
                    .frame(width: 200, height: 200)
                    .aspectRatio(nil, contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                ZStack {
                    Color(uiColor: .secondarySystemBackground)
                        .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color(uiColor: .label))
                }
            }
            Text("\(artist.strArtist ?? "Unnamed Artist")")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
            
            ScrollView {
                Text(artist.strBiographyEN ?? "No Biography")
                    .padding()
            }
        }
    }
}



struct ArtistDetail_Preview: PreviewProvider {
    
    static var previews: some View {
        ArtistDetail(artist: TestArtist.tool)
    }
}

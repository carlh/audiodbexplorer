//
//  TestData.swift
//  AudioDBExplorer
//
//  Created by Carl Hinkle on 1/27/22.
//

import Foundation

struct TestArtist {
    private static let thumbUrl = "https://www.theaudiodb.com/images/media/artist/thumb/xwvtux1416173124.jpg"
    private static let desc = "Tool is an American rock band from Los Angeles, California. Formed in 1990, the group\'s line-up has included drummer Danny Carey, guitarist Adam Jones, and vocalist Maynard James Keenan. Since 1995, Justin Chancellor has been the band\'s bassist, replacing their original bassist Paul D\'Amour. Tool has won three Grammy Awards, performed worldwide tours, and produced albums topping the charts in several countries. The band emerged with a heavy metal sound on their first studio album Undertow in 1993, and later became a dominant act in the alternative metal movement with the release of their second effort, Ænema, in 1996. Their efforts to unify musical experimentation, visual arts, and a message of personal evolution continued with Lateralus (2001) and the most recent album 10,000 Days (2006), gaining the band critical acclaim and commercial success around the world.\nDue to Tool\'s incorporation of visual arts and relatively long and complex releases, the band is generally described as a style-transcending act and part of progressive rock and art rock. The relationship between the band and today\'s music industry is ambivalent, at times marked by censorship and the band members\' insistence on privacy."
    private static let id = "111480"
    private static let artist = "Tool"
    
    
    static let tool = Artists.Artist(id: id, strArtist: artist, strBiographyEN: desc, strArtistThumb: thumbUrl)
}

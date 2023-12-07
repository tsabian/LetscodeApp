//  WebImage.swift
//  Letscode
//
//  Created by Tiago Oliveira on 26/03/23.
//  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
//

import SwiftUI

class ImageWrapper: NSObject {
    let image: Image

    init(image: Image) {
        self.image = image
    }
}

struct WebImage: View {
    private let imageURLString: String
    private static var ramImageCache = NSCache<NSURL, ImageWrapper>()

    public static subscript(url: URL) -> Image? {
        get {
            guard let currentURL = NSURL(string: url.absoluteString) else {
                return nil
            }
            return ramImageCache.object(forKey: currentURL)?.image
        }
        set {
            guard let currentURL = NSURL(string: url.absoluteString) else {
                return
            }
            if let newImage = newValue {
                ramImageCache.setObject(ImageWrapper(image: newImage), forKey: currentURL)
            } else {
                ramImageCache.removeObject(forKey: currentURL)
            }
        }
    }

    init(from urlString: String) {
        imageURLString = urlString
    }

    var body: some View {
        VStack {
            if let url = URL(string: imageURLString) {
                if let image = WebImage[url] {
                    image.resizable()
                } else {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .tint(.accentColor)

                        case .failure:
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .foregroundColor(.accentColor)
                                .opacity(0.3)

                        case .success(let image):
                            image.resizable()
                                .onAppear {
                                    WebImage[url] = image
                                }

                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
        }
    }
}

struct WebImage_Previews: PreviewProvider {
    static var previews: some View {
        WebImage(from: "https://cdn.weatherapi.com/weather/64x64/night/143.png")
    }
}

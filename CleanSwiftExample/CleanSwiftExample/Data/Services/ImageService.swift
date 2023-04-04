//
//  ImageService.swift
//  CleanSwiftExample
//
//  Created by Vlad Katsubo on 4.04.23.
//

import UIKit

protocol ImageServiceProtocol {
    func loadImage(from url: String?, completion: @escaping (UIImage?) -> Void)
    func cancelLoadingImage(for url: URL)
}

final class ImageService: ImageServiceProtocol {
    private let cache = NSCache<NSURL, UIImage>()
    private var downloadTasks: [URL: URLSessionDataTask] = [:]

    func loadImage(from urlString: String?, completion: @escaping (UIImage?) -> Void) {
        guard let urlString = urlString else { return }
        guard let url = URL(string: urlString) else { return }
        // Check if the image is already in the cache
        if let cachedImage = cache.object(forKey: url as NSURL) {
            completion(cachedImage)
            return
        }

        // Create a URLSession data task to download the image
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }

            // Handle errors and decode the image data
            if let data = data, let image = UIImage(data: data) {
                // Cache the image
                self.cache.setObject(image, forKey: url as NSURL)

                // Call the completion handler with the downloaded image
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                // Call the completion handler with nil in case of an error
                DispatchQueue.main.async {
                    completion(nil)
                }
            }

            // Remove the download task from the dictionary
            self.downloadTasks.removeValue(forKey: url)
        }

        // Save the download task in the dictionary and start it
        downloadTasks[url] = task
        task.resume()
    }

    func cancelLoadingImage(for url: URL) {
        downloadTasks[url]?.cancel()
        downloadTasks.removeValue(forKey: url)
    }
}

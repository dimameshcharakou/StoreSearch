//
//  UIImageView+DownloadImage.swift
//  StoreSearch
//
//  Created by Dzmitry Meshcharakou on 01.12.16.
//  Copyright © 2016 Dzmitry Meshcharakou. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(url: URL) -> URLSessionDownloadTask {
        let sesion = URLSession.shared
        
        let downloadTask = sesion.downloadTask(with: url, completionHandler: {
            [weak self] url, response, error in
            
            if error == nil, let url = url,
                             let data = try? Data(contentsOf: url),
                             let image = UIImage(data: data) {
                
                DispatchQueue.main.async {
                    if let strongSelf = self {
                        strongSelf.image = image
                    }
                }
            }
        })
        downloadTask.resume()
        return downloadTask
    }
}

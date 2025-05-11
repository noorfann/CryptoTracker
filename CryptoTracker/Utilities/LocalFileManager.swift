//
//  LocalFileManager.swift
//  CryptoTracker
//
//  Created by Zulfikar Noorfan on 08/05/25.
//

import Foundation
import SwiftUI


class LocalFileManager {
    static let instance = LocalFileManager()
    
    private init() { }
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        // create folder
        createFolderIfNeeded(folderName: folderName)
        
        // get path for image
        guard
            let data = image.pngData(),
            let url = getUrlForImage(folderName: folderName, imageName: imageName)
        else { return }
        
        // save image to path
        do {
            try data.write(to: url)
        } catch let error {
            print("Failed to save data \(error)")
        }
    }
    
    func getImage(folderName: String, imageName: String) -> UIImage? {
        guard let url = getUrlForImage(folderName: folderName, imageName: imageName), FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getUrlForFolder(folderName: folderName) else {return}
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true , attributes: nil)
            } catch let error {
                print("error creating directory, foldername: \(folderName) error: \(error)")
            }
        }
    }
    
    private func getUrlForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathComponent(folderName)
    }
    
    private func getUrlForImage(folderName: String, imageName: String) -> URL? {
        guard let folderUrl = getUrlForFolder(folderName: folderName) else { return nil }
        return folderUrl.appendingPathComponent(imageName + ".png")
    }
}

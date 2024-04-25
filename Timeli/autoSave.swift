//
//  autoSave.swift
//  Timeli
//
//  Created by Matthew Dudzinski on 4/25/24.
//
//  EXPERIMENTAL: For now. Don't include inside of main.
//  Functionality tested inside of Playgrounds and migrated.

import Foundation
import SwiftUI
import UIKit

class ViewController: UIViewController {
    let documentInteractionController = UIDocumentInteractionController()
    
    func createFile() {
        let text = mdContent
        let filename = getDocumentsDirectory().appendingPathComponent("example.md")
        
        do {
            try text.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
            mdshareable(url: filename)
        } catch {
            print("Unable to write to file")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func mdshareable(url: URL) {
        documentInteractionController.url = url
        documentInteractionController.uti = url.pathExtension
        documentInteractionController.name = url.lastPathComponent
        documentInteractionController.presentOptionsMenu(from: view.frame, in: view, animated: true)
    }
}

//My sources:
//
// https://www.swiftbysundell.com/articles/working-with-files-and-folders-in-swift/
//
// https://stackoverflow.com/questions/46456481/how-to-write-a-file-to-a-folder-located-at-apples-files-app-in-swift
//
// https://reintech.io/blog/working-with-files-directories-ios-apps#google_vignette
//
// https://stackoverflow.com/questions/39722844/core-data-files-location-ios-10

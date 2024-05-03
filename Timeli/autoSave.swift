//
//  autoSave.swift
//  Timeli
//
//  Created by Matthew Dudzinski on 4/25/24.
//
//  EXPERIMENTAL: For now. Don't include inside of main.
//  Functionality tested inside of Playgrounds and migrated.


// Sorry Mathew, Had to comment out to test app.
//
//
// import Foundation
// import SwiftUI
// import UIKit
//
// class ViewController: UIViewController {
//     @EnvironmentObject var contentModel: ContentModel
//
//     let documentInteractionController = UIDocumentInteractionController()
//
//     func createFile() {
//         let text = contentModel.mdContent
//         let filename = getDocumentsDirectory().appendingPathComponent("example.md")
//
//         do {
//             try text.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
//             mdshareable(url: filename)
//         } catch {
//             print("Unable to write to file")
//         }
//     }
//
//     func getDocumentsDirectory() -> URL {
//         let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//         return paths[0]
//     }
//
//     func mdshareable(url: URL) {
//         documentInteractionController.url = url // sets the URLtoo the specific url in this case .md.
//         documentInteractionController.uti = url.pathExtension // Uniform Type Identifier finds the extension inside the file manager.
//         documentInteractionController.name = url.lastPathComponent // finds the last point of the path?
//         documentInteractionController.presentOptionsMenu(from: view.frame, in: view, animated: true)
//     }
// }
//
//My sources:
//
// https://www.swiftbysundell.com/articles/working-with-files-and-folders-in-swift/
//
// https://stackoverflow.com/questions/46456481/how-to-write-a-file-to-a-folder-located-at-apples-files-app-in-swift
//
// https://reintech.io/blog/working-with-files-directories-ios-apps#google_vignette
//
// https://stackoverflow.com/questions/39722844/core-data-files-location-ios-10
//
//


import Foundation

class FileHandler {
    let fileManager = FileManager.default
    
    func getDocumentsDirectory() -> URL {
        let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask) // Tells the app that the path for the documents would be inside of the fileManager intializer.
        return paths[0] // if no path is found it will return to 0
    }
    func writeFile() {
        let fileURL = getDocumentsDirectory().appendingPathComponent("example.md") // Looks for the directory a document is stored in and looks for the Path. Example /var/mobile/Containers/Data/Application/your-app-UUID)
        let content = "Your file content here" // what ever content the user wants
        do {
            try content.write(to: fileURL, atomically: true, encoding: .utf8) // content.write just writes the file to specifed URL by iOS and encodes it in utf8
            print("File written to successfully") // Written to a file successfully in debugger
        } catch { // catch function as a break? Stops bad code and handles it.
            print ("File writting has hit an error!") // Didnt write successfully to the fileURL
        }
    }
}

//My Sources:
// https://reintech.io/blog/working-with-files-directories-ios-apps

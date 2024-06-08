//
//  noteSavingView.swift
//  Timeli
//
//  Created by Matthew Dudzinski on 6/3/24.
//

import Foundation
import SwiftUI
import Markdown

struct NoteSavingView: View {
    @Binding var mdContent: String
    @Binding var fileName: String
    @State var files: [URL] = []
    var body: some View {
        TextField("Enter the filename", text: $fileName)
            .padding()
        HStack{
            Button(action: {
                saveMD()
            }, label: {
                Text("Submit")
            })
        }
        
    }
    func saveMD() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! // Tells the app that the path for the documents would be inside of the fileManager intializer.
        let fileURL = documentsDirectory.appendingPathComponent("\(fileName).md") // Looks for the directory a document is stored in and looks for the Path. Example /var/mobile/Containers/Data/Application/your-app-UUID)
        
        do {
            try mdContent.write(to:fileURL, atomically: true, encoding: .utf8) // Writes the content inside of mdContent to the variable fileURL
            print("Successfully saved file!")
        } catch {
            print("Error saving the file \(error)")
        }
        
    }
}

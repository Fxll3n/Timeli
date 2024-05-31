//
//  NoteFileList.swift
//  Timeli
//
//  Created by Matthew Dudzinski on 5/18/24.
//

import SwiftUI
import Markdown

struct NoteFileList: View {
    @Binding var mdContent: String
    @State var files: [URL] = []
    
    var body: some View {
        List(files, id: \.self) { file in
            Button(action: {
                loadMD(file: file)
            }) {
                Text(file.lastPathComponent)
            }
        }
        .onAppear(perform: loadFiles)
        .navigationBarTitle("Files")
    }
     
    // AI used to assist in the writing of the code
    
    func loadFiles() { // Responsible for managing .md files
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! // Responsible for talking to FileManager inside of Swift Foundations. Gives ease of use for communicating between SwiftApp and iOS File System
        do { // Tells the code to only be run when specifically called to loadFiles Function
            let fileURLs = try FileManager.default.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil) // Used to preform a search of files inside of the specific directory. In this case the documentsDirectory variable called at execution
            files = fileURLs.filter { $0.pathExtension == "md" }  // Filters files for the extension .md and ignores everything else
        } catch { // Will Catch and stop execution of the function if something breaks
            print("Error while enumerating files \(documentsDirectory.path): \(error.localizedDescription)") // Displays a detailed error and path of file for a flawed execution
        }
    }
    
    func loadMD(file: URL) { // Has a function of loading .md files. with file being known as a URL for file path
        do { // Only runs when loadMD is called
            mdContent = try String(contentsOf: file, encoding: .utf8)  // Whatever is in mdContent is needed to be placed into a string, with it's contents being a file and encoded in Unicode Transformation Format 8
            print("Successfully loaded file!")
        } catch {
            print("Error loading the note \(error)")
        }
    }
}

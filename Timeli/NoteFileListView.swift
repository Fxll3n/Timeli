//
//  NoteFileList.swift
//  Timeli
//
//  Created by Matthew Dudzinski on 5/18/24.
//

//import SwiftUI
//import Markdown
//
//struct NoteFileList: View {
//    @Binding var mdContent: String
//    @State var files: [URL] = []
//    
//    var body: some View {
//        List(files, id: \.self) { file in
//            Button(action: {
//                loadMD(file: file)
//            }) {
//                Text(file.lastPathComponent)
//            }
//        }
//        .onAppear(perform: loadFiles)
//        .navigationBarTitle("Files")
//    }
//    
//    func loadFiles() {
//        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        do {
//            let fileURLs = try FileManager.default.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil)
//            files = fileURLs.filter { $0.pathExtension == "md" }
//        } catch {
//            print("Error while enumerating files \(documentsDirectory.path): \(error.localizedDescription)")
//        }
//    }
//    
//    func loadMD(file: URL) {
//        do {
//            mdContent = try String(contentsOf: file, encoding: .utf8)
//            print("Successfully loaded file!")
//        } catch {
//            print("Error loading the note \(error)")
//        }
//    }
//}

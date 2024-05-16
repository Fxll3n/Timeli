//
//  NotesView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/19/24.
//

import SwiftUI
import Markdown

struct NotesView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var contentModel: ContentModel
    @State var isEditing = false
    
    @State private var mdContent = "abcdefghijklmnopqrstuvwxyz\n**abcdefghijklmnopqrstuvwxyz**\n*abcdefghijklmnopqrstuvwxyz*\n~abcdefghijklmnopqrstuvwxyz~\n# abcdefghijklmnopqrstuvwxyz"
    var body: some View {
        VStack{
            Text("Notes")
                .bold()
                .underline()
                .font(.title)
            HStack{
                Spacer()
                Button(action: {
                    isEditing.toggle()
                }, label: {
                    Text(isEditing ? "Done" : "Edit")
                })
                .padding()
                Button {
                    saveMD()
                } label: {
                    Text("Save")
                }
            }
            
            if isEditing{
                TextEditor(text: $mdContent)
            }else{
                Markdown(content: $mdContent)
            }
        } .onAppear(perform: loadMD)
    }
    
    func loadMD() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! // Tells the app that the path for the documents would be inside of the fileManager intializer.
        let fileURL = documentsDirectory.appendingPathComponent("note.md") // Looks for the directory a document is stored in and looks for the Path. Example /var/mobile/Containers/Data/Application/your-app-UUID)
        
        do {
            mdContent = try String(contentsOf: fileURL, encoding: .utf8) // Reads the content inside of fileURL
            print("Successfully loaded file!")
        } catch {
            print("Error loading the note \(error)")
        }
    }
    func saveMD() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! // Tells the app that the path for the documents would be inside of the fileManager intializer.
        let fileURL = documentsDirectory.appendingPathComponent("note.md") // Looks for the directory a document is stored in and looks for the Path. Example /var/mobile/Containers/Data/Application/your-app-UUID)
        
        do {
            try mdContent.write(to:fileURL, atomically: true, encoding: .utf8) // Writes the content inside of mdContent to the variable fileURL
            print("Successfully saved file!")
        } catch {
            print("Error saving the file \(error)")
        }
        
    }
    
 
    

}

#Preview {
    NotesView()
}

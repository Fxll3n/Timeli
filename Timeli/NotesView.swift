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
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent("note.md")
        
        do {
            mdContent = try String(contentsOf: fileURL, encoding: .utf8)
            print("Successfully loaded file!")
        } catch {
            print("Error loading the note \(error)")
        }
    }
    func saveMD() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent("note.md")
        
        do {
            try mdContent.write(to:fileURL, atomically: true, encoding: .utf8)
            print("Successfully saved file!")
        } catch {
            print("Error saving the file \(error)")
        }
        
    }
    
 
    

}

#Preview {
    NotesView()
}

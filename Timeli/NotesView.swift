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
            HStack{
                Spacer()
                Button(action: {
                    isEditing.toggle()
                }, label: {
                    Text(isEditing ? "Done" : "Edit")
                })
                .padding(10)
            }
            
            if isEditing{
                TextEditor(text: $mdContent)
            }else{
                Markdown(content: $mdContent)
            }
        }
    }
    
    func createFile() {
        let filename = getDocumentsDirectory().appendingPathComponent("example.md")
        
        do {
            try mdContent.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
            print("File created successfully")
        } catch {
            print("Unable to write to file")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
 
    

}

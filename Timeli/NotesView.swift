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
    @State var isEditing = false
    @State var showSavePopup = false
    @State var fileName = ""
    @State var showFileList = false
    @State var files: [URL] = []
    @FocusState private var fileNameIsFocused: Bool
    @State private var mdContent = "abcdefghijklmnopqrstuvwxyz\n**abcdefghijklmnopqrstuvwxyz**\n*abcdefghijklmnopqrstuvwxyz*\n~abcdefghijklmnopqrstuvwxyz~\n# abcdefghijklmnopqrstuvwxyz"
    
    var body: some View {
        VStack{
            Text("Notes")
                .bold()
                .font(.title)
            HStack{
                Spacer()
                TextField("File Name", text: $fileName)
                    .focused($fileNameIsFocused)
                    .submitLabel(.join)
                Spacer()
                Button(action: {
                    isEditing.toggle()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5.0)
                            .frame(width: 40, height: 30)
                            .foregroundStyle(Color.blue)
                        Text(isEditing ? "Done" : "Edit")
                            .foregroundStyle(Color.white)
                    }
                        
                })
                Button {
                    showSavePopup = true
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5.0)
                            .frame(width: 40, height: 30)
                            .foregroundStyle(Color.blue)
                        Text("Save")
                            .foregroundStyle(Color.white)
                    }
                
                }
                Button {
                    showFileList = true
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5.0)
                            .frame(width: 40, height: 30)
                            .foregroundStyle(Color.blue)
                        Text("Load")
                            .foregroundStyle(Color.white)
                    }
                
                }
            }.padding(.trailing)
            
            if isEditing{
                TextEditor(text: $mdContent)
            }else{
                Markdown(content: $mdContent)
            }
        } .onAppear(perform: loadMD)
        .alert(isPresented: $showSavePopup) {
            Alert(title: Text("Save File"), message: Text("Enter a name for the file"), primaryButton: .default(Text("Save")) {
                saveMD()
            }, secondaryButton: .cancel())
        }
        .sheet(isPresented: $showFileList) {
            NoteFileList(mdContent: $mdContent)
        }
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

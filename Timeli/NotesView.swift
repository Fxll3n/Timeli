//
//  NotesView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/19/24.
//
// AI used in File Management for assistance in writing of code
import SwiftUI
import Markdown


struct NotesView: View {
    @State var isEditing = false
    @State var showSavePopup = false
    @State var fileName = ""
    @State var showFileList = false
    @State var showSaveList = false
    @State var files: [URL] = []	
    @State private var selectedColor: Color = Color.black
    @State private var colorData = ColorData()
    @State private var mdContent = "abcdefghijklmnopqrstuvwxyz\n**abcdefghijklmnopqrstuvwxyz**\n*abcdefghijklmnopqrstuvwxyz*\n~abcdefghijklmnopqrstuvwxyz~\n# abcdefghijklmnopqrstuvwxyz"
    @FocusState private var fileNameIsFocused: Bool
    @Environment(\.modelContext) private var context
    var body: some View {
        VStack{
            Spacer()
            Text("Notes")
                .font(.custom("Rosmatika", size: 50))
                .bold()
                .font(.title)
                .onAppear(){
                    selectedColor = colorData.loadColor()
                }
            HStack{
                Spacer()
                Group{
                    Button(action: {
                        isEditing.toggle()
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5.0)
                                .frame(width: 40, height: 30)
                                .foregroundStyle(selectedColor)
                            Text(isEditing ? "Done" : "Edit")
                                .foregroundStyle(Color.white)
                        }
                            
                    })
//                    Button(action: {
//                        saveMD()
//                    }, label: {
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 5.0)
//                                .frame(width: 40, height: 30)
//                                .foregroundStyle(selectedColor)
//                            Text("Save")
//                                .foregroundStyle(Color.white)
//                        }
//                    })
                    Button {
                        showSaveList = true
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5.0)
                                .frame(width: 65, height: 30)
                                .foregroundStyle(selectedColor)
                            Text("Save As")
                                .foregroundStyle(Color.white)
                        }
                    
                    }
                    Button {
                        showFileList = true
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5.0)
                                .frame(width: 40, height: 30)
                                .foregroundStyle(selectedColor)
                            Text("Load")
                                .foregroundStyle(Color.white)
                        }
                    
                    }
                }
            }.padding(.trailing)
            
            if isEditing{
                TextEditor(text: $mdContent)
                    .ignoresSafeArea(.keyboard)
            }else{
                Markdown(content: $mdContent)
            }
        } .onAppear(perform: loadMD)
        .sheet(isPresented: $showFileList) {
            NoteFileList(mdContent: $mdContent)
        }
        .sheet(isPresented: $showSaveList){
            NoteSavingView(mdContent: $mdContent, fileName: $fileName)
        }
    }
    
    
    func loadMD() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! // Tells the app that the path for the documents would be inside of the fileManager intializer.
        let fileURL = documentsDirectory.appendingPathComponent("\(fileName).md") // Looks for the directory a document is stored in and looks for the Path. Example /var/mobile/Containers/Data/Application/your-app-UUID)
    
        do {
            mdContent = try String(contentsOf: fileURL, encoding: .utf8) // Reads the content inside of fileURL
            print("Successfully loaded file!")
        } catch {
            print("Error loading the note \(error)")
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

#Preview {
    NotesView()
}

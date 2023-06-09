//
//  WCNewPost.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 5/16/23.
//

import SwiftUI
import PhotosUI

struct WCNewPost: View {
    var onPost: (Post)->()
    @State private var commentText: String = ""
    @State private var commentImageData: Data?
    
    @Environment(\.dismiss) private var dismiss
    @State private var isLoading: Bool = false
    @State private var errorMessage: String = ""
    @State private var showError: Bool = false
    @State private var photoItem: PhotosPickerItem?
    @State private var showImagePicker: Bool = false
    @FocusState private var showKeyboard: Bool
   
var body: some View {
    VStack(alignment: .leading, spacing: 0){
        HStack{
            Menu {
                Button("Cancel", role: .destructive){
                    dismiss()
                }
            }label:{
                Text("Cancel")
                    .font(Font.menuAction)
                    .foregroundColor(.white)
            }
            Spacer()
            Text("CHATTER")
                .foregroundColor(.white)
                .font(Font.header)
            Spacer()
            Button(action: preparePost){
                Text("Post")
                    .font(Font.menuAction)
                    .foregroundColor(.white)
            }
            .disabled(commentText == "")
        }
        .padding(.horizontal,15)
        .padding(.vertical,3)
        .background(Color.black)
        
    ScrollView(.vertical, showsIndicators: false){
        VStack(spacing: 15){
            TextField("Tell us about your drink!", text: $commentText, axis: .vertical)
                .focused($showKeyboard)
            
            if let commentImageData, let image = UIImage(data: commentImageData){
                GeometryReader{
                    let size = $0.size
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .overlay(alignment: .topTrailing){
                            Button{
                                withAnimation(.easeInOut(duration:0.25)){
                                    self.commentImageData = nil
                                }
                            }label:{
                                Image(systemName: "trash")
                                    .fontWeight(.bold)
                                    .tint(.white)
                                    .background(.black)
                            }
                            .padding(10)
                        }
                    }
                    .clipped()
                    .frame(height:220)
                }
            }
            .padding(20)
        }
        Divider()
        HStack{
            Button{
                showImagePicker.toggle()
            }label:{
                Image(systemName: "photo.on.rectangle")
            }
            Spacer()
            Button("Done"){
                showKeyboard = false
            }
        }
        .padding(.horizontal,15)
        .padding(.vertical,5)
        .padding(.horizontal,15)
        .foregroundColor(Color.black)
    }
    .photosPicker(isPresented: $showImagePicker, selection: $photoItem)
    .onChange(of: photoItem){photo in
        if let photo{
            Task{
                if let imageData = try? await photo.loadTransferable(type: Data.self),
                    let image = UIImage(data: imageData),
                    let compressedImageData = image.jpegData(compressionQuality: 0.5){
                        await MainActor.run(body:{
                            commentImageData = compressedImageData
                            photoItem = nil
                        })
                    }
                }
            }
        }
    .alert(errorMessage, isPresented: $showImagePicker, actions:{})
    }
    
    func preparePost(){
        isLoading = true
        showKeyboard = false
        let currentUser = UserService.sharedUser.user
        
        /*Task{
            do{
                //guard let profileURL = profileURL else{return}
                let imageRefID = "\(currentUser.userId)\(Date())"
                let storageRef = Storage.storage().reference().child("Post_Images").child("whiskeyImages").child(imageReferenceId)
                if let commentImageData{
                    let x = try await storageRef.putData(commentImageData)
                    let downloadUrl = try await storageRef.downloadUrl()
                }
            }
            catch{
                await showPostError(error)
            }
        }*/
    }
    
    //TODO: Move to Error Handling
    func showPostError(_ error: Error)async{
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            showError.toggle()
        })
    }
}

struct WCNewPost_Previews: PreviewProvider {
    static var previews: some View {
        WCNewPost{_ in
        }
    }
}



/*
 .photosPicker(isPresented: $showImagePicker, selection: $photoItem)
 
 .onChange(of: photoItem){photo in
     if let photo{
         Task{
             if let imageData = try? await photo.loadTransferable(type: Data.self),
                let image = UIImage(data: imageData),
                let compressedImageData = image.jpegData(compressionQuality: 0.5){
                     await MainActor.run(body:{
                         commentImageData = compressedImageData
                         photoItem = nil
                     })
                 }
                 
             }
         }
     }
 */

//
//  ImagePicker.swift
//  Kwik Card
//
//  Created by Seun Olalekan on 2021-09-17.
//

import SwiftUI

struct ImagePicker : UIViewControllerRepresentable{

    
    @Environment(\.presentationMode) private var presentationMode
    @Binding var image : UIImage?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let picker = UIImagePickerController()
        
        picker.delegate = context.coordinator
        
        return picker
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        
        let parent : ImagePicker
        
       init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[.originalImage] as? UIImage{
                parent.image = image
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func imagePickerController(){
        
        
    }
    
    
    
}

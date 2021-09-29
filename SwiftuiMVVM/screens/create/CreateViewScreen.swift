//
//  CreateViewScreen.swift
//  SwiftuiMVVM
//
//  Created by Apple user on 29/09/21.
//

import SwiftUI

struct CreateViewScreen: View {
    @Environment(\.presentationMode) var presentationMode
 
    @ObservedObject var viewModel = CreateViewModel()
    @State var title = ""
    @State var body1 = ""
  @State var button = false
    
    var body: some View {
        VStack{
            TextField("Title", text: $title).padding()
                .background(Color.gray.opacity(0.4))
                .foregroundColor(.white)
                .cornerRadius(10)
            TextField("Body", text: $body1).padding()
                .background(Color.gray.opacity(0.4))
                .foregroundColor(.white)
                .cornerRadius(10)
            
            Button(action: {
               
                viewModel.apiPostCreate1(post: Post(id: "", title: title, body: body1), handler: {value in})
                
                button = true
                presentationMode.wrappedValue.dismiss()
                
            }, label: {
                Text("Button")
            })
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            
        }.padding()
    }
}

struct CreateViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateViewScreen()
    }
}

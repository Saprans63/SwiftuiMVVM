//
//  CreateViewModel.swift
//  SwiftuiMVVM
//
//  Created by Apple user on 29/09/21.
//

import Foundation


class CreateViewModel: ObservableObject {
    
   
    @Published var isLoading = false
    
    @Published var posts = [Post]()
    @Published var post = Post()

   
    
func apiPostCreate1(post:Post,handler: @escaping (Bool) -> Void){
    isLoading = true
    AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: {response in
        self.isLoading = false
       
        switch response.result {
        case .success:
            print(response.result)
            
            handler(true)
        case let .failure(error):
            print(error)
            handler(false)
        }
    })
}
}

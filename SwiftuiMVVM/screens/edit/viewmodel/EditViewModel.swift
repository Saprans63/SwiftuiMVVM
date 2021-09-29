//
//  EditViewModel.swift
//  SwiftuiMVVM
//
//  Created by Apple user on 29/09/21.
//

import Foundation
class EditViewModel: ObservableObject {
    
   
    @Published var isLoading = false
    
    @Published var posts = [Post]()
    @Published var post = Post()

   
    func apiPostUpdate(post:Post,handler: @escaping (Bool) -> Void){
        isLoading = true
        AFHttp.put(url: AFHttp.API_POST_UPDATE + String(post.id!), params: AFHttp.paramsPostUpdate(post: post), handler: {response in
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

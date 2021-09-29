//
//  HomeViewScreen.swift
//  SwiftuiMVVM
//
//  Created by Apple user on 29/09/21.
//

import SwiftUI

struct HomeViewScreen: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State private var showingEdit = false
    
    func delete(indexSet: IndexSet) {
        let post = viewModel.posts[indexSet.first!]
        viewModel.apiPostDelete(post: post, handler: {value in
            viewModel.apiPostList()
        })
    }
    
    var body: some View {
        NavigationView{
                ZStack{
                    List{
                        ForEach(viewModel.posts, id:\.self){ post in
                            PostCell(post: post).onLongPressGesture {
                                showingEdit.toggle()
                            }.sheet(isPresented: $showingEdit) {
                                EditViewScreen()
                            }
                        }
                        .onDelete(perform: delete)
                        
                    }.listStyle(PlainListStyle())
                    
                    if viewModel.isLoading {
                        ProgressView()
                    }
                }
                .navigationBarItems(leading:
                                        Button(action: {
                                            viewModel.apiPostList()
                                        }, label: {
                                            Image("ic_refresh")
                                        }), trailing:
                                            NavigationLink(
                                                destination: CreateViewScreen(),
                                                label: {
                                                    Image("ic_add")
                                                })
                )
                .navigationBarTitle("SiftUI MVVM",displayMode: .inline)
            }.onAppear{
                viewModel.apiPostList()
            }
        }
    }

struct HomeViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewScreen()
    }
}

//
//  DiaryApp.swift
//  Diary
//
//  Created by 松村拓洋 on 2023/02/02.
//

import SwiftUI

@main
struct DiaryApp: App {
    @StateObject private var store = DiaryStore()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                
                ContentView(diarys: $store.diary){
                    DiaryStore.save(diary: store.diary){ result in
                        if case .failure(let failure) = result {
                            fatalError(failure.localizedDescription)
                        }
                         
                    }
                }
            }
            .onAppear{
                DiaryStore.load{ result in
                    switch result{
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let diary):
                        store.diary = diary
                    }
                }
            }
            
        }
    }
}

//
//  DiaryApp.swift
//  Diary
//
//  Created by 松村拓洋 on 2023/02/02.
//

import SwiftUI

@main
struct DiaryApp: App {
    @State private var diary = Diary.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView(diarys: $diary)
            }
            
        }
    }
}

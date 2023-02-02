//
//  ContentView.swift
//  Diary
//
//  Created by 松村拓洋 on 2023/02/02.
//

import SwiftUI

struct ContentView: View {
    let diary :[Diary]
    
    var body: some View {
        List{
            ForEach(diary) { diary in
                NavigationLink(destination: Text(diary.title).background(Color.red)){
                    CardView(diary: diary)
                }
            }
        }
        .navigationTitle("日記一覧")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView(diary: Diary.sampleData)
        }
    }
}

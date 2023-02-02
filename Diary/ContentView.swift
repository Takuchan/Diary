//
//  ContentView.swift
//  Diary
//
//  Created by 松村拓洋 on 2023/02/02.
//

import SwiftUI

struct ContentView: View {
    @Binding var diarys : [Diary]
    
    var body: some View {
        List{
            ForEach($diarys) { $diary in
                NavigationLink(destination: DiaryDetail(diarys: $diary)){
                    CardView(diary: diary)
                }
            }
        }
        .navigationTitle("日記一覧")
        .toolbar{
            Button(action: {
                
            }){
                Image(systemName: "plus")
            }
            .accessibilityLabel("Create a new Diary")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView(diarys: .constant(Diary.sampleData))
        }
    }
}

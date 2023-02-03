//
//  ContentView.swift
//  Diary
//
//  Created by 松村拓洋 on 2023/02/02.
//

import SwiftUI

struct ContentView: View {
    @Binding var diarys : [Diary]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewDiary = false
    @State private var newDiaryData = Diary.Data()
    let saveAction: () -> Void
    
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
                isPresentingNewDiary = true
            }){
                Image(systemName: "plus")
            }
            .accessibilityLabel("Create a new Diary")
        }
        .sheet(isPresented: $isPresentingNewDiary){
            NavigationView{
                DairyEditView(data: $newDiaryData)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            Button("キャンセル"){
                                isPresentingNewDiary = false
                                newDiaryData = Diary.Data()
                            }
                        }
                        ToolbarItem(placement:.confirmationAction){
                            Button("追加"){
                                let newDiary = Diary(data: newDiaryData)
                                diarys.append(newDiary)
                                isPresentingNewDiary = false
                                newDiaryData = Diary.Data()
                            }
                        }
                    }
            }
            
        }
        .onChange(of: scenePhase){phase in
            if phase == .inactive { saveAction() }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView(diarys: .constant(Diary.sampleData),saveAction: {})
        }
    }
}

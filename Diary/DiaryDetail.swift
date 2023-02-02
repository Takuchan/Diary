//
//  DiaryDetail.swift
//  Diary
//
//  Created by 松村拓洋 on 2023/02/02.
//

import SwiftUI

struct DiaryDetail: View {
    @Binding var diarys: Diary
    @State private var isPresentingEditView = false
    @State private var data = Diary.Data()
    var body: some View {
        List {
            Section(header: Text("本文")){
                VStack(alignment: .leading){
                    
                    HStack {
                        Text(diarys.subtitle)
                            .font(.title2)
                        .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    Text(diarys.detail)
                    
                    
                    Spacer()
                    Text(dateString(date:diarys.currentTime) + "の日記")
                    
                }
                .padding()
            }
            Section(header:Text("この記事に関連のある人")){
                ForEach(diarys.attendees){ attendee in
                    Label(attendee.name,systemImage: "person")
                }
            }
        }
        .navigationTitle(diarys.title)
        .toolbar{
            Button("Edit"){
                isPresentingEditView = true
                data = diarys.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView{
                DairyEditView(data: $data)
                    .navigationTitle("日記編集")
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            Button("戻る"){
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement:.confirmationAction){
                            Button("編集完了"){
                                isPresentingEditView = false
                                diarys.update(from: data)
                            }
                        }
                    }
            }
            
        }
    }
    func dateString (date:Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyy-MM-dd"
        
        return dateFormatter.string(from: date)
    }
}

struct DiaryDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DiaryDetail(diarys: .constant(Diary.sampleData[0]))
        }
       
    }
}

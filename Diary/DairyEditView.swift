//
//  DairyEditView.swift
//  Diary
//
//  Created by 松村拓洋 on 2023/02/03.
//

import SwiftUI

struct DairyEditView: View {
    @Binding var data:Diary.Data
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form{
            Section(header:Text("メイン編集")){
                TextField("タイトル",text:$data.title)
                HStack{
                    Slider(value: $data.lengthInEnjoy,in: 0...100,step: 1){
                        Text("幸福度")
                    }
                    Spacer()
                    Text("\(Int(data.lengthInEnjoy))%😀")
                }
            }
            Section(header:Text("サブ編集")){
                TextField("サブタイトル",text: $data.subtitle)
                
            }
            Section(header:Text("日記本文")){
                TextField("本文",text:$data.detail)
                    .frame(width: .infinity,height: 300,alignment: .topLeading)
            }
            Section(header: Text("日記関連")) {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    data.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action:{
                        withAnimation{
                            let attendee = Diary.Attendee(name:newAttendeeName)
                            data.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
        
    }
}

struct DairyEditView_Previews: PreviewProvider {
    static var previews: some View {
        DairyEditView(data: .constant(Diary.sampleData[0].data))
    }
}

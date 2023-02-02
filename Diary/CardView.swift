//
//  CardView.swift
//  Diary
//
//  Created by 松村拓洋 on 2023/02/02.
//

import SwiftUI

struct CardView: View {
    let diary:Diary
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(diary.title)
                    .font(.title)
                Text(diary.subtitle)
                    .font(.subheadline)
            }
            Spacer()
            Text(dateString(date: diary.currentTime))
        }.padding()
        
    }
    
    func dateString (date:Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyy-MM-dd"
        
        return dateFormatter.string(from: date)
    }
}

struct CardView_Previews: PreviewProvider {
    static var diary = Diary.sampleData[0]
    static var previews: some View {
        CardView(diary: diary)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}

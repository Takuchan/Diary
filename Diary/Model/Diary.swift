//
//  Diary.swift
//  Diary
//
//  Created by 松村拓洋 on 2023/02/02.
//

import Foundation

struct Diary:Identifiable{
    let id :UUID
    var title: String
    var subtitle: String
    var detail: String
    var currentTime :Date
    var image: UIImage
    
    init(id: UUID = UUID(), title: String, subtitle: String,detail: String, currentTime: Date) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.detail = detail
        self.currentTime = currentTime
    }
}

extension Diary{
    static var sampleData: [Diary] = [
        Diary(title: "北海道に行った", subtitle: "北海道はでっかいどう",detail: "北海道で美味いもんを食い散らかした。特に美味かったのはうまかっちゃん。これは博多料理です。",currentTime: Date()),
        Diary(title: "沖縄に行った", subtitle: "沖縄とか草はでっかいどう",detail: "北海道で美味いもんを食い散らかした。特に美味かったのはうまかっちゃん。これは博多料理です。",currentTime: Date()),
        Diary(title: "京都に行った", subtitle: "京都はでっかいどう",detail: "北海道で美味いもんを食い散らかした。特に美味かったのはうまかっちゃん。これは博多料理です。",currentTime: Date()),
    ]
}

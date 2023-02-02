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
    var attendees : [Attendee]
    var detail: String
    var currentTime :Date
    var lengthInEnjoy : Int
    
    
    init(id: UUID = UUID(), title: String, subtitle: String, detail: String, currentTime: Date, attendee: [String],lengthInEnjoy:Int) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.detail = detail
        self.currentTime = currentTime
        self.attendees = attendee.map{ Attendee(name: $0) }
        self.lengthInEnjoy = lengthInEnjoy
    }

}
extension Diary{
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    struct Data{
        var title: String = ""
        var subtitle : String = ""
        var detail : String = ""
        var attendees : [Attendee] = []
        var lengthInEnjoy :Double = 5
    }
    var data: Data{
        //つまりはここで10~30行目のデータを一つの塊として取り出せるようにしているというわけさ
        Data(title: title,subtitle: subtitle, detail: detail, attendees: attendees,lengthInEnjoy: Double(lengthInEnjoy))
    }
    mutating func update(from data: Data) {
        title = data.title
        subtitle = data.subtitle
        detail = data.detail
        attendees = data.attendees
        lengthInEnjoy = Int(data.lengthInEnjoy)
    }
}

extension Diary{
    static var sampleData: [Diary] = [
        Diary(title: "北海道に行った", subtitle: "北海道はでっかいどう",detail: "こんにちわ。ゴホン、ちょっとだけ寝坊しました。かなりネットでは、東京マラソンのこととかが注目されているという話だそうですね。。。昨日とうってかわって、どんよりとしたうっとうしい天気みたいであります。私は今日ばかりはいつもと違って絶不調ですけれど、少しずつ頑張ります、、、。なんとなくですが、どうにも松村邦弘っていうのについてが興味あるんですよね。急に激しい運動はしないようにしようと思いました。では明日会いましょう。。。",currentTime: Date(),attendee: ["たくみ","たみ"],lengthInEnjoy: 5),
        Diary(title: "沖縄に行った", subtitle: "沖縄とか草はでっかいどう",detail: "北海道で美味いもんを食い散らかした。特に美味かったのはうまかっちゃん。これは博多料理です。",currentTime: Date(),attendee: ["あたん","ごいご"],lengthInEnjoy: 3),
        Diary(title: "京都に行った", subtitle: "京都はでっかいどう",detail: "北海道で美味いもんを食い散らかした。特に美味かったのはうまかっちゃん。これは博多料理です。",currentTime: Date(),attendee: ["ごちゃごた"],lengthInEnjoy: 2),
    ]
}

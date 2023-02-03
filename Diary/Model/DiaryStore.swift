//
//  DiaryStore.swift
//  Diary
//
//  Created by 松村拓洋 on 2023/02/03.
//

import Foundation
import SwiftUI

class DiaryStore : ObservableObject{
    @Published var diary : [Diary] = []
    
    private static func fileURL() throws -> URL{
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("diary.data")
    }
    
    static func load(completion: @escaping(Result<[Diary],Error>)-> Void){
        DispatchQueue.global(qos: .background).async {
            do{
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else{
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let dailyDiary = try JSONDecoder().decode([Diary].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(dailyDiary))
                }
            }catch{
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(diary:[Diary],completion: @escaping (Result<Int,Error>)-> Void){
        DispatchQueue.global(qos: .background).async {
            do{
                let data = try JSONEncoder().encode(diary)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(diary.count))
                }
            }catch{
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}

//
//  Movie.swift
//  Netflix
//
//  Created by Bryan on 2022/1/11.
//

import Foundation

struct TrendingTitleResponse:Codable{
    let results : [Title]
}

struct Title:Codable{
    let id : Int
    let media_type:String?
    let original_title:String?
    let overview:String?
    let vote_average : Double?
    let title :String?
    let vote_count:Int?
    let poster_path:String?
}

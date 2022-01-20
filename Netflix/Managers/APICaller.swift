//
//  APICaller.swift
//  Netflix
//
//  Created by Bryan on 2022/1/11.
//

import Foundation


enum APIError:Error{
    case failedTogetData
}


class APICaller {
    
    static let shared = APICaller()
    private init(){}
    
    
    struct Constants{
        static let API_KEY = "1649792a12d4dd7c7777682ce08f63c7"
        static let baseUrl = "https://api.themoviedb.org"
    }
    
    public func getTrendingMovies(completion:@escaping (Result<TrendingTitleResponse,Error>)->Void){
        let url = Constants.baseUrl + "/3/trending/movie/day?api_key=" + Constants.API_KEY
        guard let url = URL(string: url) else{return}
        let requerst = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: requerst) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            
            do {
//                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result))
            }catch{
                print(error)
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    public func getTrendingTV(completion:@escaping (Result<[Title],Error>)->Void){
        let url = Constants.baseUrl + "/3/trending/tv/day?api_key=" + Constants.API_KEY
        guard let url = URL(string: url) else{return}
        let requerst = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: requerst) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            
            do {
//                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            }catch{
                print(error)
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    public func getPopularMovie(completion:@escaping (Result<[Title],Error>)->Void){
        let url = Constants.baseUrl + "/3/movie/popular?api_key=" + Constants.API_KEY
        guard let url = URL(string: url) else{return}
        
        let requerst = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: requerst) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            
            do {
//                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(result)
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))

            }catch{
                print(error)
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    public func getUpcomingMovie(completion:@escaping(Result<[Title],Error>)->Void){
        let url = Constants.baseUrl + "/3/movie/upcoming?api_key=" + Constants.API_KEY
        guard let url = URL(string: url) else{return}
        
        let requerst = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: requerst) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            
            do {
//                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(result)
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))

            }catch{
                print(error)
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    public func getTopRatedMoview(completion:@escaping(Result<[Title],Error>)->Void){
        let url = Constants.baseUrl + "/3/movie/top_rated?api_key=" + Constants.API_KEY
        guard let url = URL(string: url) else{return}
        
        let requerst = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: requerst) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            
            do {
//                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(result)
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))

            }catch{
                print(error)
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    public func getDiscoverMoview(){
        let url = Constants.baseUrl + "/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
        guard let url = URL(string: url) else {return}
        var request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            
            do {
                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(result)
            }catch{
                print(error)
                
            }
        }
        task.resume()
        
    }
    
    public func search(with query:String,completion:@escaping (Result<[Title],Error>) -> Void){
        let url = Constants.baseUrl + "/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)"
        guard let url = URL(string: url) else {return}
        var request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            
            do {

//               let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//               print(result)
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                let titles = result.results
                completion(.success(titles))
            }catch{
                print(error)
                completion(.failure(error))
                
            }
        }
        task.resume()
        
        
    }
    
    
    
    
    
}

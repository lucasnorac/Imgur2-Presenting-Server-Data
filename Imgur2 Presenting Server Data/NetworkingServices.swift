//
//  NetworkingServices.swift
//  Imgur2 Presenting Server Data
//
//  Created by Lucas Caron Albarello on 31/12/2017.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import UIKit

typealias JSON = [String: Any]
class NetworkingServices{
    static let shared = NetworkingServices()
    private init(){}
    
    let session = URLSession.shared
    
    func getImgurs(sucess sucessBlock: @escaping (GetImgursResponse) -> Void  ){
        guard let url = URL(string: "https://api.imgur.com/3/gallery/r/cats") else {return}
        var request = URLRequest(url: url)
        request.addValue("Client-ID 4d51e9bcb96851f", forHTTPHeaderField: "Authorization")
        session.dataTask(with: request) { (data, _, _) in
            guard let data = data else {return}
            do{
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON else {return}
                let getImgursResponse = try GetImgursResponse(json: json)
                DispatchQueue.main.async {
                    sucessBlock(getImgursResponse)
                }
            }catch{}
        }.resume()
    }
    func downloadImages(fromLink link: String, sucess sucessBlock: @escaping (UIImage)->Void){
        guard let url = URL(string: link) else {return}
        session.dataTask(with: url) { (data, _, _) in
            guard let data = data,
                let image = UIImage(data: data)
            else {return}
            DispatchQueue.main.async {
                sucessBlock(image)
            }
            
        }.resume()
    }
}

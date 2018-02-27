//
//  MarvelAPI.swift
//  Marvel's Heroes
//
//  Created by Bárbara Souza on 27/02/18.
//  Copyright © 2018 Bárbara Souza. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI {
    
    private static let basePath = "https://gateway.marvel.com:443/v1/public/characters?"
    private static let privateKey = "b7ef6b130c6464c225c8244fd0ed331e6186ef9f"
    private static let publicKey = "d096b1431ee1c901861f4a73b9df2fba"
    private static let limit = 20
    
    class func loadHero(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void){
        let offset = page * self.limit
        let startsWith : String
        if let name = name, name.isEmpty{
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        }else{
            startsWith = ""
        }
        
        let url = self.basePath + "offset=\(offset)&limit=\(self.limit)&" + startsWith + self.getCredentials()
        Alamofire.request(url).responseJSON { (response) in
            guard let data = response.data,
                let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from: data),
                marvelInfo.code == 200 else {
                    onComplete(nil)
                    return
            }
            onComplete(marvelInfo)
            
        }
        
        
    }
    
    private class func getCredentials() -> String{
        let timeStamp = String(Date().timeIntervalSince1970)
        let hash = MD5(timeStamp + privateKey + publicKey).lowercased()
        return "ts=\(timeStamp)&apikey=\(publicKey)&hash=\(hash)"
    }
}

//
//  Game.swift
//  GameApp
//
//  Created by Sofiane Beors on 02/05/2022.
//

class Game: Decodable {
    var id = 0
    var name = ""
    var smallImageURL = ""
    var bigImageURL = ""
    var score = 0
    var platform = ""
    
    init(id: Int, name: String, smallImageURL: String, bigImageURL: String, score: Int, platform: String) {
        // TODO: Set the properties
    }
}

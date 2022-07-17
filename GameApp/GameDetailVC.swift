//
//  GameDetailVC.swift
//  GameApp
//
//  Created by Sofiane Beors on 02/05/2022.
//

import UIKit

class GameDetailVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!

    var game: Game?

    override func viewDidLoad() {
        super.viewDidLoad()
        
         // TODO: Uncomment this block of code to display the game
        
        /* if let game = game {
            self.nameLabel.text = game.name
            self.scoreLabel.text = "\(game.score)"
            self.platformLabel.text = game.platform
            self.imageView.image = self.getGameImage(game: game)
        } */
    }
    
    func getGameImage(game: Game) -> UIImage {
        let data = try? Data.init(contentsOf: URL(string: game.bigImageURL)!)
        guard let data = data else { return UIImage() }
        return UIImage(data: data)!
    }
}

//
//  GameTVC.swift
//  GameApp
//
//  Created by Sofiane Beors on 02/05/2022.
//

import UIKit

class GameTVC: UITableViewController {

    var games = [Game]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: call the function that get the games
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Set the right number of rows based on the games array
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // TODO: Set the name of the game as the text of the cell's label (textLabel property)
        
        // cell.imageView?.image = self.getGameImage(game: self.games[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue", sender: nil)
    }
    
    func getGameImage(game: Game) -> UIImage {
        let data = try? Data.init(contentsOf: URL(string: game.smallImageURL)!)
        guard let data = data else { return UIImage() }
        return UIImage(data: data)!
    }

    func download(at url: String, handler: @escaping (Data?) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            handler(data)
        }
        task.resume()
    }
    
    
    func getGames() {
        self.download(at: "https://education.3ie.fr/ios/StarterKit/GameCritic/GameCritics.json") { data in
            if let data = data {
                do {
                    self.games = try JSONDecoder().decode([Game].self, from: data)

                    // TODO: Reload the tableView to display the games on the Main Thread
                } catch {
                    print("Failed to parse data")
                }
            } else {
                print("failed to get data")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let detailVC = segue.destination as! GameDetailVC
            let selectedCell = self.tableView.indexPathForSelectedRow
            
            if let row = selectedCell?.row {
                // TODO: Set the game property from the GameDetail View Controller as the game you've selected
            }
        }
    }
}

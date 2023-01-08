//
//  GameViewController.swift
//  MyGames
//
//  Created by User on 01/04/21.
//  Copyright © 2021 User. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbConsole: UILabel!
    @IBOutlet weak var lbReleaseDate: UILabel!
    @IBOutlet weak var ivCover: UIImageView!
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lbTitle.text = game.title
        lbConsole.text = game.console?.name
        if let releaseDate = game.releaseDate {
            let formartter = DateFormatter()
            formartter.dateStyle = .long
            formartter.locale = Locale(identifier: "pt-BR")
            lbReleaseDate.text = "Lançamento: " + formartter.string(from: releaseDate)
        }
        
        if let image = game.cover as? UIImage {
            ivCover.image = image
        } else {
            ivCover.image = UIImage(named: "noCoverFull")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? AddEditViewController
        vc?.game = self.game
    }

}

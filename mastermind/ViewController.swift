//
//  ViewController.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    let gameState = GameState()

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = UIHostingController(rootView: GameView(gameState: gameState))
        addChild(vc)
        vc.view.frame = view.frame
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }


}


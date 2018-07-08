//
//  GameOverScene.swift
//  Cannon
//
//  Created by David Hincapie on 11/16/15.
//  Copyright © 2015 David Hincapie. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    // configure GameOverScene
    init(size: CGSize, won: Bool, time: CFTimeInterval) {
        super.init(size: size)
        self.backgroundColor = SKColor.whiteColor()
        let greenColor =
        SKColor(red: 0.0, green: 0.6, blue: 0.0, alpha: 1.0)
        
        let gameOverLabel = SKLabelNode(fontNamed: "Chalkduster")
        gameOverLabel.text = (won ? "You Win!" : "You Lose")
        gameOverLabel.fontSize = 60
        gameOverLabel.fontColor =
            (won ? greenColor : SKColor.redColor())
        gameOverLabel.position.x = size.width / 2.0
        gameOverLabel.position.y =
            size.height / 2.0 + gameOverLabel.fontSize
        self.addChild(gameOverLabel)
        
        let elapsedTimeLabel = SKLabelNode(fontNamed: "Chalkduster")
        elapsedTimeLabel.text =
            String(format: "Elapsed Time: %.1f seconds", time)
        elapsedTimeLabel.fontSize = 24
        elapsedTimeLabel.fontColor = SKColor.blackColor()
        elapsedTimeLabel.position.x = size.width / 2.0
        elapsedTimeLabel.position.y = size.height / 2.0
        self.addChild(elapsedTimeLabel)
        
        let newGameLabel = SKLabelNode(fontNamed: "Chalkduster")
        newGameLabel.text = "Begin New Game"
        newGameLabel.fontSize = 24
        newGameLabel.fontColor = greenColor
        newGameLabel.position.x = size.width / 2.0
        newGameLabel.position.y =
            size.height / 2.0 - gameOverLabel.fontSize
        self.addChild(newGameLabel)
    }
    
    // not called, but required if you override SKScene's init
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // present a new GameScene when user touches screen
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let doorTransition =
        SKTransition.doorsOpenHorizontalWithDuration(1.0)
        let scene = GameScene(size: self.size)
        scene.scaleMode = .AspectFill
        self.view?.presentScene(scene, transition: doorTransition)
    }
}
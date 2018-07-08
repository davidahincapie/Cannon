//
//  GameViewController.swift
//  Cannon
//
//  Created by David Hincapie on 11/16/15.
//  Copyright (c) 2015 David Hincapie. All rights reserved.
//

import AVFoundation
import SpriteKit

// sounds defined once and reused throughout app
var blockerHitSound: AVAudioPlayer!
var targetHitSound: AVAudioPlayer!
var cannonFireSound: AVAudioPlayer!

class GameViewController: UIViewController {
    // called when GameViewController is displayed on screen
    override func viewDidLoad() {
        super.viewDidLoad()
      
        do{
        // load sounds when view controller loads
        blockerHitSound =  try AVAudioPlayer(contentsOfURL:
            NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(
                "blocker_hit", ofType: "wav")!), fileTypeHint: nil)
        targetHitSound = try AVAudioPlayer(contentsOfURL:
            NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(
                "target_hit", ofType: "wav")!), fileTypeHint: nil)
        cannonFireSound = try AVAudioPlayer(contentsOfURL:
            NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(
                "cannon_fire", ofType: "wav")!), fileTypeHint: nil)
        }catch {
            print(error)
        }
        let scene = GameScene(size: view.bounds.size) // create scene
        scene.scaleMode = .AspectFill // resize scene to fit the screen
        
        let skView = view as! SKView // get GameViewController's SKView
        skView.showsFPS = true // display frames-per-second
        skView.showsNodeCount = true // display # of nodes on screen
        skView.ignoresSiblingOrder = true // for SpriteKit optimizations
        skView.presentScene(scene) // display the scene
    }
}

//
//  Scene.swift
//  ARPostItNote
//
//  Created by Ilias Basha on 9/26/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import SpriteKit
import ARKit

class Scene: SKScene {
    
    override func didMove(to view: SKView) {
        // Setup your scene here
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        if let touchLocation = touches.first?.location(in: sceneView) {
            // Create anchor with ARSKView
        }
    }
}

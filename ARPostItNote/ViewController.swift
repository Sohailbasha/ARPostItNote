//
//  ViewController.swift
//  ARPostItNote
//
//  Created by Ilias Basha on 9/26/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

class ViewController: UIViewController, ARSKViewDelegate {
    
    @IBOutlet var sceneView: ARSKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and node count
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        // Load the SKScene from 'Scene.sks'
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: - ARSKViewDelegate
    
    /*func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        // Create and configure a node for the anchor added to the view's session.
        let labelNode = SKLabelNode(text: "👾")
        labelNode.horizontalAlignmentMode = .center
        labelNode.verticalAlignmentMode = .center
        return labelNode;
    }*/
    
    func view(_ view: ARSKView, didAdd node: SKNode, for anchor: ARAnchor) {
        let alert = UIAlertController(title: "Add Note", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder  = "Your Description"
        }
        let add = UIAlertAction(title: "Add", style: .default) { (_) in
            
            let label = SKLabelNode(text: alert.textFields?.first?.text)
            label.horizontalAlignmentMode = .center
            label.verticalAlignmentMode = .center
            
            node.addChild(label)
    }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(add)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

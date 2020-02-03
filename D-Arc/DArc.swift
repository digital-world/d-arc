//
//  DArcScene.swift
//  D-Arc
//
//  Created by WarGrey Ju on 2020/2/1.
//  Copyright © 2020 WarGrey Ju. All rights reserved.
//

import SpriteKit;
import GameplayKit;

class DArcScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        let w = (self.size.width + self.size.height) * 0.05;
        
        self.label = SKLabelNode(fontNamed: "Lucida Grande");
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let label = self.label {
            self.addChild(label);

            label.text = "D-Arc";
            label.position.x = (self.size.width - label.frame.width) * 0.5;
            label.position.y = (self.size.height - label.frame.height) * 0.5;
            
            label.alpha = 0.0;
            label.run(SKAction.fadeIn(withDuration: 2.0));
        }
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5;
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)));
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                            SKAction.fadeOut(withDuration: 0.5),
                                            SKAction.removeFromParent()]));
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos;
            n.strokeColor = SKColor.green;
            self.addChild(n);
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos;
            n.strokeColor = SKColor.blue;
            self.addChild(n);
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos;
            n.strokeColor = SKColor.red;
            self.addChild(n);
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            if let action = SKAction.init(named: "Pulse") {
                label.run(action, withKey: "fadeInOut");
            }
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

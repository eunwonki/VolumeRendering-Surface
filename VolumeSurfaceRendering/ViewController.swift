import UIKit
import SceneKit

class ViewController: UIViewController {
    @IBOutlet weak var scnView: SCNView!
    
    var device: MTLDevice!
    var root: SCNNode!
    var cameraController: SCNCameraController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        scnView.scene = SCNScene()
        scnView.backgroundColor = .gray
        
        device = scnView.device!
        root = scnView.scene!.rootNode
        cameraController = scnView.defaultCameraController
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let node = SCNNode(geometry: SCNBox(width: 1, height: 0.7, length: 0.5,
                                            chamferRadius: 0))
        root.addChildNode(node)
        
        cameraController.target = node.boundingSphere.center
    }
}


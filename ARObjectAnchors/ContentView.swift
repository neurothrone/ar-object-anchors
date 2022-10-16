//
//  ContentView.swift
//  ARObjectAnchors
//
//  Created by Zaid Neurothrone on 2022-10-16.
//

import RealityKit
import SwiftUI

struct ContentView : View {
  var body: some View {
    ARViewContainer().edgesIgnoringSafeArea(.all)
  }
}

// NOTE: When object is detected: construct a green sphere around the object

struct ARViewContainer: UIViewRepresentable {
  func makeUIView(context: Context) -> ARView {
    let arView = ARView(frame: .zero)
    
    let objectAnchor = try! Experience.loadObjectScene()
    let sphere = ModelEntity(
      mesh: .generateSphere(radius: 0.2),
      materials: [SimpleMaterial(color: .green.withAlphaComponent(0.3), roughness: .float(.zero), isMetallic: true)]
    )
    objectAnchor.addChild(sphere)
    
    arView.scene.addAnchor(objectAnchor)
    
    return arView
  }
  
  func updateUIView(_ uiView: ARView, context: Context) {}
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif

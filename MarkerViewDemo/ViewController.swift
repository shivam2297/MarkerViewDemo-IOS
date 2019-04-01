//
//  ViewController.swift
//  MarkerViewDemo
//
//  Created by Shivam Bansal on 27/03/19.
//

import UIKit

class ViewController: UIViewController {

    private let rectView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
    private let marker = UIView(frame: CGRect(x: 50, y: 50, width: 5, height: 5))

    private var panGesture: UIPanGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        rectView.backgroundColor = UIColor.clear
        rectView.layer.borderWidth = 3
        rectView.layer.borderColor = UIColor.black.cgColor

        marker.backgroundColor = UIColor.black

        self.view.addSubview(rectView)
        self.view.addSubview(marker)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureTapped))
        rectView.addGestureRecognizer(panGesture)
    }

    @objc func panGestureTapped(sender: UIPanGestureRecognizer) {
        let touchLoc = sender.location(in: self.view)

        switch sender.state {
        case .possible:
            break
        case .began:
            break
        case .changed:
            if rectView.frame.contains(marker.frame) {
                switch touchLoc {
                case touchLoc where touchLoc.x > marker.frame.maxX:
                    if rectView.frame.minX == marker.frame.minX {
                        sender.state = .cancelled
                    }
                    break
                case touchLoc where touchLoc.x < marker.frame.minX:
                    if rectView.frame.maxX == marker.frame.maxX {
                        sender.state = .cancelled
                    }
                    break
                default:
                    break
                }
            }
            rectView.center = touchLoc
        case .ended:
            break
        case .cancelled:
            break
        case .failed:
            break
        }
    }
}


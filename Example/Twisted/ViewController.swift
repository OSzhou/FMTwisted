//
//  ViewController.swift
//  Twisted
//
//  Created by Zhouheng on 03/10/2022.
//  Copyright (c) 2022 Zhouheng. All rights reserved.
//

import UIKit
import Twisted

class ViewController: UIViewController {
    private var centerRect: CGRect = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configUI()
    }

    private func configUI() {
        let w = UIScreen.main.bounds.size.width
        let h = UIScreen.main.bounds.size.height
        
        let vH = 9 / 16 * w
        
        let bW: CGFloat = 100
        let bH: CGFloat = 100
        
        let imgView = UIImageView(image: UIImage(named: "videoTest"))
        imgView.frame = CGRect(x: 0, y: 0, width: w, height: h)
        view.addSubview(imgView)
        
        let x: CGFloat = 100
        let y: CGFloat = (h - vH) / 2 + 50
        
        let test = UIView(frame: CGRect(x: x, y: y, width: bW, height: bH))
        test.backgroundColor = .purple
        view.addSubview(test)
        
        let x1: CGFloat = w - bW - 100
        let y1: CGFloat = (h - vH) / 2 + 50
        
        let test1 = UIView(frame: CGRect(x: x1, y: y1, width: bW, height: bH))
        test1.backgroundColor = .purple
        view.addSubview(test1)
        
        let x2: CGFloat = w - bW - 100
        let y2: CGFloat = h - (h - vH) / 2 - bH - 50
        
        let test2 = UIView(frame: CGRect(x: x2, y: y2, width: bW, height: bH))
        test2.backgroundColor = .purple
        view.addSubview(test2)
        
        let x3: CGFloat = 100
        let y3: CGFloat = h - (h - vH) / 2 - bH - 50
        
        let test3 = UIView(frame: CGRect(x: x3, y: y3, width: bW, height: bH))
        test3.backgroundColor = .purple
        view.addSubview(test3)
        
        let x4: CGFloat = (w - bW) / 2
        let y4: CGFloat = (h - bH) / 2
        centerRect = CGRect(x: x4, y: y4, width: bW, height: bH)
        let test4 = UIView(frame: centerRect)
        test4.backgroundColor = .purple
        view.addSubview(test4)
    }
    
    private func pixelAnalysis() {
        let finder = PixelFinder()
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        let v1 = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        v.addSubview(v1)
        guard let cgImg = finder.snapshotScreenInView(contentView: view, targetRect: CGRect(x: 100, y: 100, width: 300, height: 300)) else { return }
//        guard let cgImg = finder.snapshotScreenInView(contentView: view, targetRect: UIScreen.main.bounds) else { return }
        finder.searchEveryPixel(cgImage: cgImg, color: .black, percent: 0.90, tolerance: 5, openOpt: false) { result in
            switch result {
            case .success(let flag):
//                print("sImage --- \(cgImg), result --- \(flag)")
                break
            case .failure(let errMsg):
                print("pixel analysis failure: \(errMsg)")
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        pixelAnalysis()
//        navigationController?.pushViewController(Test1ViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


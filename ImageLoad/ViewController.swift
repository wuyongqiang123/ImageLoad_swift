//
//  ViewController.swift
//  ImageLoad
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 wyq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imV: UIImageView?
    let progressIndicatorView = CircularLoaderView(frame: CGRectZero)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        imV = UIImageView.init(frame: CGRectMake(100, 100, 100, 100))
        imV?.image = UIImage.init(named:"placeholder.png")
        self.view.addSubview(imV!)
        imV?.addSubview(self.progressIndicatorView)
        progressIndicatorView.frame = (imV?.bounds)!
        progressIndicatorView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]

        let url = NSURL(string: "http://www.raywenderlich.com/wp-content/uploads/2015/02/mac-glasses.jpeg")

        imV?.setImageWithURL(url, placeholderImage:UIImage.init(named: "placeholder.png"), options: SDWebImageCacheMemoryOnly, progress: {[weak self] (receivedSize, expectedSize) -> Void in
            self!.progressIndicatorView.progress = CGFloat(receivedSize)/CGFloat(expectedSize)
            }, success: {[weak self] (image, success) in
                self!.progressIndicatorView.reveal()
            }, failure: {(error) in
                print("error")
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


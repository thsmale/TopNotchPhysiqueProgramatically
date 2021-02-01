//
//  Post.swift
//  TopNotchPhysiqueProgramatically
//
//  Created by Tommy Smale on 9/13/20.
//  Copyright © 2020 Tommy Smale. All rights reserved.
//

import UIKit

struct Post {
    init() {
        
    }
    
    struct Image {
        var image: UIImage
        var caption: String?
        
        init?(image: UIImage, caption: String) {
            if image.cgImage == nil || image.ciImage == nil {
                return nil
            }
            
            self.image = image

            if(caption.isEmpty) {
                self.caption = nil
            }
            
        }
    }

    struct Video {
        var video: URL
        var caption: String?
        
        init?(video: URL, caption: String) {

            guard !video.isFileURL else {
                return nil
            }
            
            self.video = video

            if(caption.isEmpty) {
                self.caption = nil
            }
                
        }
    }
}

/*
struct Post {
    var image: UIImage?
    var video: URL?
    var caption: String?
    
    init?(image: UIImage, caption: String) {
        if image.cgImage == nil || image.ciImage == nil {
            return nil
        }
        
        self.image = image

        if(caption.isEmpty) {
            self.caption = nil
        }
        
        self.video = nil
    }
        
    
    init?(video: URL, caption: String) {

        guard !video.isFileURL else {
            return nil
        }
        
        self.video = video

        if(caption.isEmpty) {
            self.caption = nil
        }
            
        self.image = nil
    }
    
}
 */

/*

 */

/*
struct PostImage {
    var image: UIImage
    var caption: String?
    
    init?(image: UIImage, caption: String) {
        if image.cgImage == nil || image.ciImage == nil {
            return nil
        }
        
        self.image = image

        if(caption.isEmpty) {
            self.caption = nil
        }
        
    }
}

struct PostVideo {
    var video: URL
    var caption: String?
    
    init?(video: URL, caption: String) {

        guard !video.isFileURL else {
            return nil
        }
        
        self.video = video

        if(caption.isEmpty) {
            self.caption = nil
        }
            
    }
}
*/

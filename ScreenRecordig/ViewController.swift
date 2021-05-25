//
//  ViewController.swift
//  ScreenRecordig
//
//  Created by Tej on 2021-05-18.
//

import UIKit
import AVKit


class ViewController: UIViewController {
    @IBOutlet weak var imagview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType: "mp4")!)
        imagview.contentMode = .scaleAspectFill
        imagview.image = url.generateThumbnail()
        
    }}
extension URL {
    func generateThumbnail() -> UIImage? {
        do {
            let asset = AVURLAsset(url: self)
            let imageGenerator = AVAssetImageGenerator(asset: asset)
            imageGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imageGenerator.copyCGImage(at: CMTime(seconds: 5, preferredTimescale: 60),
                                                         actualTime: nil)
            return UIImage(cgImage: cgImage)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

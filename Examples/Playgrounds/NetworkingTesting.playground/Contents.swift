import UIKit



let urlStr = "https://ga-core-production-herokuapp-com.global.ssl.fastly.net/assets/course_icons/MOB-582372ee1d626d37ef7b8ee70be05b7c.png"
let url = NSURL(string: urlStr)

let session = NSURLSession.sharedSession()

var img: UIImage? = nil

func onCompletion(location:NSURL!, response:NSURLResponse!, error:NSError!) {
    println("Done!")
    
    let imageData = NSData(contentsOfURL: location)
    img = UIImage(data: imageData!)
}

let downloadTask: NSURLSessionDownloadTask = session.downloadTaskWithURL(
    url!,
    completionHandler: onCompletion
)

downloadTask.resume()

img

// swift


// dispatch
DispatchQueue.main.asyncAfter(deadline: .now()){
}

DispatchQueue.global(qos: .background).async {
}

let group = DispatchGroup()
group.enter()
group.leavel()
group.notify(queue: .main) {
}

// activity indicator 
var spinner = UIActivityIndicatorView(style: .whteLarge)
spinner.startAnimating()



// networking

request = URLRequest(url: url)
request.httpMethod = "GET"

let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
	if let data - data
	{
		let json = try? JSONSerialization.jsonObject(with: data, options: [])
	}
}
dataTask.resume()



// MARK: - # image cache

var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView 
{
    func loadImage(urlString: String) 
    {
        if let cacheImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage 
        {
            self.image = cacheImage
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error 
            {
                print("Couldn't download image: ", error)
                return
            }
            
            guard let data = data else { return }

            let image = UIImage(data: data)
            imageCache.setObject(image, forKey: urlString as AnyObject)
            
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}


// You should initialise the cache once your application launches.
func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool
{
    let URLCache = NSURLCache(memoryCapacity: 4 * 1024 * 1024, 
                              diskCapacity: 20 * 1024 * 1024,
                              diskPath: nil)

    NSURLCache.setSharedURLCache(URLCache)

    return true
}


class ImageCache 
{
    static func storeImage(urlString: String, img: UIImage)
    {
        let path = NSTemporaryDirectory().appending(UUID().uuidString)
        let url = URL(fileURLWithPath: path)

        let data = img.jpegData(compressionQuality: 0.5)
        try? data?.write(to: url)

        var dict = UserDefaults.standard.object(forKey: "ImageCache") as? [String: String]

        if dict == nil
        {
            dict = [String: String]()
        }

        dict![urlString] = path
        UserDefaults.standard.set(dict, forKey: "ImageCache")
    }

    static func loadImage(urlString: String, completion: @escaping (String: UIImage?) -> Void)
    {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard error == nil else { return }
            guard let d = data else { return }

            DispatchQueue.main.async {
                if let image = UIImage(data: d)
                {
                    completion(urlString, image)
                }
            }
        }.resume()
    }
}
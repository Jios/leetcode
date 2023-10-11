// swift


// date formatter
static let dFormat: String = "MM/dd/yyyy"
static let sFormat: String = "yyyy-MM-dd"
static let twoDigitYearFormat = "M/d/yy"
static let monthYearFormat: String = "MMMM yyyy"
static let tFormat = "HH:mm:ss"
static let esFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
static let simpleFormat = "yyyy-MM-dd HH:mm Z"
static let openHouseFormat = "E, MMM d yyyy"

let formatter = DateFormatter()
formatter.dateFormat = "MM/dd/yyyy"
formatter.locale = Locale(identifier: "en_US_POSIX")

let date = Date(timeIntervalSince1970: interval)
let formatedDateString = formatter.string(from: date)



// dispatch
DispatchQueue.main.asyncAfter(deadline: .now()){
}

DispatchQueue.global(qos: .background).async {
}

let group = DispatchGroup()
group.enter()
group.leave()
group.notify(queue: .main) {
}

let semaphore = DispatchSemaphore(value: 1)
semaphore.wait()
semaphore.signal()

// activity indicator 
var spinner = UIActivityIndicatorView(style: .whteLarge)
spinner.startAnimating()



// codable with DictionaryDecoder()

if let arrDicts = dict[Key.kMultimediaList] as? [[String: Any]]
{
    for dict in arrDicts
    {
        do {
            let decoder = DictionaryDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let multimedia = try decoder.decode(Multimedia.self, from: dict)
            
            multimedias.append(multimedia)
        }
        catch {
            DebugManager.debug("Decode Multimedia object failed")
            DebugManager.debug("\(arrDicts)")
            assertionFailure("Decode Multimedia object failed")
        }
    }
}

// codable example

struct Element: Codable
{
    // MARK: - # Value
    
    enum Value: Codable
    {
        // MARK: - # ValueError
        
        enum ValueError: Error {
            case invalid
        }
        
        // Result Type
        case bool(Bool)
        case string(String)
        case int(Int)
        case double(Double)
        case date(Date)
        
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            
            if let string = try? container.decode(String.self)
                , let value = Date.date(from: string)
            {
                self = .date(value)
            }
            else if let value = try? container.decode(Bool.self)
            {
                self = .bool(value)
            }
            else if let value = try? container.decode(Int.self)
            {
                self = .int(value)
            }
            else if let value = try? container.decode(Double.self)
            {
                self = .double(value)
            }
            else if let value = try? container.decode(String.self)
            {
                self = .string(value)
            }
            else
            {
                throw(ValueError.invalid)
            }
        }
        
        func encode(to encoder: Encoder) throws {
            return
        }
    }
    
    // MARK: - # Element
    
    var id: String?
    var title: String
    var value: Value
    
    enum CodingKeys: String, CodingKey
    {
        case id
        case title
        case value
    }
    
    // func decode<T>(valueType: T) where T : Decodable {

    // }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try? container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        value = try container.decode(Value.self, forKey: .value)
    }
}




// ------------------------------------




// networking

request = URLRequest(url: url)
request.httpMethod = "GET"

let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
	if let data = data
	{
		let json = try? JSONSerialization.jsonObject(with: data, options: [])
	}
}
dataTask.resume()




// ------------------------------------



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


// --

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



// ------------------------------------



func getItemData(completion: @escaping (Result<Content, Error>) -> Void)
{
    // pretend this is a real network request, but you
    // can assume there will always be data and no error
    session.networkTask { data in
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let content = try decoder.decode(Content.self, from: data)
            
            completion(.success(content))
        }
        catch (let error)
        {
            completion(.failure(error))
        }
    }
}

func fetch(urlStr: String?, completion: @escaping (Result<(data: Data, url: String), Error>) -> Void)
{
    guard let urlStr = urlStr, let url = URL(string: urlStr) else {
        completion(.failure(Err.dataErr))
        return
    }
    
    URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
        
        if let data = data
        {
            completion(.success((data: data, url: urlStr)))
        }
        else
        {
            completion(.failure(error ?? Err.dataErr))
        }
    }).resume()
}

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





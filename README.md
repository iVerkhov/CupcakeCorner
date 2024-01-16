* Sending and receiving Codable data with URLSession and SwiftUI
* Loading an image from a remote server
* Validating and disabling forms
* Adding Codable conformance to an @Observable class
* Adding haptic effects
* Taking basic order details
* Checking for a valid address
* Preparing for checkout
* Sending and receiving orders over the internet

**CHDLLENGE**

1. _Our address fields are currently considered valid if they contain anything, even if it’s just only whitespace. Improve the validation to make sure a string of pure whitespace is invalid._
1. _If our call to placeOrder() fails – for example if there is no internet connection – show an informative alert for the user. To test this, try commenting out the request.httpMethod = "POST" line in your code, which should force the request to fail._
1. _For a more challenging task, try updating the Order class so it saves data such as the user's delivery address to UserDefaults. This takes a little thinking, because @AppStorage won't work here, and you'll find getters and settings cause problems with Codable support. Can you find a middle ground?_
  

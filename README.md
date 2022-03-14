# FabDogs

Simple app which fetches dogbreeds from TheDOGApi service and displays the contents.  


App uses Swit UI for display of content.


## Features and Views

Listing of First set of Dog Breeds

Details View for each Dog Breed


---



## Using

- iOS 15
- Xcode 13.1
- Alamofire (5.5.0)
- PromiseKit 6.17.0


## API Service

https://docs.thedogapi.com


## Dependencies
https://cocoapods.org/pods/PromiseKit

https://cocoapods.org/pods/Alamofire

---

## Implementation

- Using MVVM design pattern for seperation of Business logic and View, allowing the app to be maintanable and testable.
- using dependency Injection for Model in to ViewModel and ViewModel in to 
- Binding of Datasource and View using @Publisher and @ObservedObject model.  As soon as the data is updated of fetched from service Layer. it is avilable to View 
- Netowk layer abstactino using protocols to easiyl swap out the calls with local mock response
- As soon as the app loads, data is fethed from the network. if the app has no connectivity, 'No results' shown.
 
- Image in details page could return different size images, using content - fit 

## Unit tests
- ViewModels tested with sample data 


## Further Improvements that could be carried out

- Started a variant of the current Version by using ViewModelFactory and Controller to central data acccess and data transformation 


- UI tests could be added with MockData

- loading indicator for data loading
- Caching of Data for a feed list for a period or cache expiry
- Caching of Images to unnecessary fetches
- Abstraction of Imageloader to use urlsession by injection 


## Notes:
 
Initially started of with SwiftUI and Combine but stepped back as it seems bit of overkill for what I was trying to achieve.

Use promiseKit with Alamofire  to tie up async calls and with network data fetch.

It was intresting and fun to work on it.

---

```

## Author

Jidh George

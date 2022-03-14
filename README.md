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
- Using dependency Injection for Model in to ViewModel and ViewModel in to View.
- Binding of Datasource and View using @Publisher and @ObservedObject model.  As soon as the data is updated of fetched from service Layer. it is avilable to View 

- As soon as the app loads, data is fetched from the network. if the app has no connectivity, 'No results' shown.
 
 DetailsView Section the Image is fetched and cached.

## Unit tests
- ViewModels tested with sample data


## Further Improvements that could be carried out

- Started a variant of the current Version in seperate repository by using ViewModelFactory and Controller to central data acccess and data transformation.(WIP)

- UI tests could be added with MockData

- loading indicator for data loading
- Caching of Data for a feed list for a period or cache expiry
- Caching of Images to unnecessary fetches


## Notes:
 
Initially started of with SwiftUI and Combine but stepped back as it seems bit of overkill for what I was trying to achieve.

Use promiseKit with Alamofire  to tie up async calls and with network data fetch. Alamofire calls are very simple and could be easily swapped with URLSession.

Fun litle project.

---

```

## Author

Jidh George

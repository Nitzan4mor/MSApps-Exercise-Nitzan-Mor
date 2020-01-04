# MSApps-Exercise-Nitzan-Mor


iOS Interview questions

Describe what is iOS? IOS is the apple's mobile operating system

What is a Cocoa Touch class?

Cocoa Touch class allows developing apps for IOS using frameworks and libaries, such as UIKit, Foundation, MapKit and many more.

Describe app lifecycle?

before the app starts (device is off or app wasn't tapped) its in Not Running State. when the app is tapped it goes to In Active State - app is going into the foreground but still isn't able to process events. when the app is in the foreground and ready to process events it goes to Active State. when the user goes into other apps, the app goes into Background State, if there is still code to process it will finish processing it and then go into Susspension State, otherwise it will go immediately into Susspension State. when the app is in Susspension State it will not be able to execute code and in case of not enough memory it will be terminated. if the app is in Susspension State and the user taps the app it will go from Susspension to Background to Inactive to Active State. if the app was terminated then it will begin the life cycle again.

Give example scenarios when an application goes into InActive state?

when the app is starting but still can't proccess events it will go to In Active state and then to Active state. when the app goes from Background to Active it will go through In Active state. when the app is in Active state and the user receive a phone call.

What is an AdHoc certificate?

Ad Hoc is used for either testing your app before distributing it to the app store or developing app for a limited number of specific devices, example - app that is used only by your family and therefore is not needed to be distributed to the store.

What is a Singleton class? Where would you use it in the application and how?

 a Singleton class is a design pattern which we use to limit the class to only 1 initialization. it is usefull in cases when you want to have only 1 instance of the class. example - class that communicate with the database (DAO) needs to be singelton. in swift lazy loading is different from java, so you don't have to double check locks using synchronized, instead you can use this example code - class DAO { static let shared = DAO() private init(){} } in java you will need to start the shared at null and create static function that will initialized it while synchronizing in the function and inside of it to make sure there won't be more than 1 instance in case more than 1 Threads will enter it at the same time.

What's the difference between synchronous and asynchronous calls in Objective-C?

synchronous - an action that is running on the main thread and until it is finished, other actions have to wait. asynchronous - an action that is running on a different thread and therefore allows the main thread to responde to the user interface. example - long time taking actions such as HTTP request needs to run asynchronous, otherwise the app will "freeze" and the user won't be able to interact with it.

What is a dispatch ? give an example

dispatch allows you to manage which actions need to run on the main queue and which actions need to run on other queues. in swift there are build in 6 dispatch queues, sorted by priority - 1)DispatchQueue.main 2)DispatchQueue.global(qos: .userInteractive) 3)DispatchQueue.global(qos: .userInitiated) 4)DispatchQueue.global(qos: .default) 5)DispatchQueue.global(qos: .utility) 6)DispatchQueue.global(qos: .background) there queues run parallel - all tasks put in the queue will run simultanesly. you can create an custom queue and set it to run as serial - only when a task if finished a new task will start.

What is delegates/Protocol ? give example of use it

the delegate protocol is a desing pattern also known and Observer, or in android - Listener. the delegate allows you to subscribe to an upcoming event and receive a callback when the event is executed, without having to check over and over again. daily example - when you want to book a reservation for a restaurant and it's currently full, you can sign up on a waiting list instead of calling the restaurant repeatedly to check if a space opened up. programming example - when you need to pass data from 1 controller to the another controller, an delegate will be usefull instead of having 1 controller affecting the 2nd controller directly. the way to conform the delegate pattern is by using protcol in swift (or interface in java). you will be able to see my use of it in the movie app. i also used it frequently in my studio app that is in the App store.

Have you uploaded an app to the app store? 

yes, i did several dayes ago. it got aprroved and is available at this link - https://apps.apple.com/us/app/nitzans-yoga-studio/id1492982065?l=iw&ls=1. I also recorded a video that walks you through the app - https://www.youtube.com/watch?v=IXSl7WVEMM4&feature=youtu.be.

If yes: what is the process? Describe the process End-To-End.

first of all i signed up to the Apple Developer Program in order to submit apps to the app store.
connect to the app store.
click on my apps and choose new app (+).
fill the app details - name, language, bundle id, SKU and user access.
fill all the app information required - Privacy Policy URL , categories, Age rating.
fill the Pricing and Availability of the app.
fill the Prepare for submission properties - Keywords, Support URL, Marketing URL, Promotional Text, Description, Copyright, Contact Information , Version Release.
take screenshots of the app in different device sizes and opload to the prepare for submission.
in Xcode- i went over all the code and tried to "crash" the app to make sure there aren't any bugs. after it choose generic device and Product->Archive to create the build and connect it to the app distribution request. after the build is processed i submited the app for review and it was aprroved.
i sent another app for review today and hopefully it will also be approved.

Show-off Test :

Please build an app with 4 screens that does the following:

First screen: Splash screen

Go to http://api.androidhive.info/json/movies.json and download the JSON file. - Parse the JSON and save it in CoreData

Go to next screen: movie list

Second screen: Movie list

Display the list of movies from the CoreData by release year and from new to old. - Clicking a movie should show you a movie details screen

Clicking on the add button should take to a QR scanning screen

Third screen: Movie details

Show movie details

Back press should take you back to the movie list screen

Fourth screen: QR code scanner

Setup a QR scanner from the camera with the provided QR code. - Parse and save the response in CoreData.

Display it in the movie details screen

Don't need too focus on design too much as long as it looks alright to you.

Must use: Delegates, Protocols and Autolayout

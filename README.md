# footprint

**An easy to use app that tracks your Covid footprint.**


*Close your eyes and imagine.* It is the peak of the COVID pandemic in your local community, and you work as a food delivery driver mainly with Doordash, but also with Grubhub sometimes for some extra cash. It is a Thursday evening and you get home. Before cooking dinner, decide to lay on the couch and relax while checking your email. Almost immediately, the relaxation you’ve been feeling vanishes. You’ve gotten your COVID results back, and you tested _positive_. Instantly, your mind rushed through all the people you’ve come in contact with. First the people who may have infected you, and then all the people you may have infected yourself. Imagine how many lives you could save just by notifying the people you came in contact with in the past few days. Introducing **footprint**. An easy to use app that tracks your COVID footprint. 

----------------------------------------------------------------

Simply allow the app to use your location, and it will track where you have been. Every 5 minutes, it will record your location, time, and place, and store it in encrypted, secure servers.

When an alert is submitted, along with photo evidence of a positive COVID test, all the people with the app that were in the same vicinity of you from the past 2 weeks will receive an alert. We are working on automatically verifying photo evidence with machine learning for maximum efficiency. 

As more people install and use our app, **more lives can be saved**. Our plan to implement this app is to partner with local governments to ensure widespread participation to *maximize* *effectiveness* of the app.

----------------------------------------------------------------

We created the footprint app using **Flutter**. All the interfaces are coded using **Dart** and multiple **APIs**. 

By first using *location and permissionc APIs*, we can ask for their location and store it in Firebase’s Cloud Firestore, along with the time and date. 

When someone sends an alert, they can upload proof of the test, which we will later automatically verify using machine learning. 

Next, we pull all coordinates from firestore and use the *geolocator API* to calculate and measure distances between coordinates. 

Then, taking all distances below 10 meters, we compiled it all into a table, each displaying specific time, date, and location, and plot it in a map using the *google maps api.*


**With footprint and everyone's help, we will be able to shut down COVID-19's spread.**

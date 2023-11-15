
# ClearScore Technical Task
## Edward Downhill

Thank you for taking the time to look through my app. I look forward to hearing your feedback.



### Decisions & Approach

1)
I chose SwiftUI to write the app's layout.

SwiftUI is a lot easier to write than UIKit in my opinion and considering that it doesn't rely on storyboards or nibs to create the layouts, I also find that it is a lot easier to write UI tests for.

The fact that SwiftUI's engine is very different from UIKit's, how views are structs that are more rapidly created and destroyed. It also means that it is usually more performant and reliable, thanks to its two-way data binding.

Furthermore, with SwiftUI, creating layouts requires me to be less explicit with my constraints. This results in a product that is more likely to appear and behave as intended across different form-factors.

2)
I wrote the app using an MVVM architechture.

Due to SwiftUI's data-binding nature, MVVM allows for a simple data flow between the various layers of architechture.

Additionally, splitting the logic into isolated files results in a codebase that is more organized and easier to maintain.

3) 
I implemented dependency injection for some of the services.

Primarily, this is extremely helpful for testing. By using dependency injection, I can easily create mock data sources and isolate small parts of modules and their logic to create relevant tests, without simulating the whole application environment.

4)
I used async/await in a number of places. Thanks to this release, it is now so much easier to write asynchronous code. Using async/await means that my code is significantly cleaner and has much less nesting, improving readability.

### Future Changes

If I had more time, there are a number of things that I would go back to update:

1)
Firstly, I would write more UI tests, specifically for error cases and whether the correct data is being shown on the screen. I did not have time to show error message on the screen at all, so I would have also liked to implement this.

2)
I would like to improve the consistency of the app, creating standard view modifiers, components, and parameters that could be implemented throughout the application (e.g. corner radius, padding).

3)
There are a number of design changes I would make, including adding more micro-animations as data loads (e.g. adding a loading animation to the donut view on the home screen).

I would have also liked to play around with some more exciting designs on the home screen, perhaps even as simple as adding a background image similar to that found in the ClearScore app.

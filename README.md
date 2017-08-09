# This is the tip calculator we've made in our first two sessions at the Women Who Code iOS meetups at Coding Dojo!

### What it does:
1. Type in the amount of your bill
2. The tip calculator displays how much to tip for 10%, 15%, and 20% tips.
3. The tip calculator also displays the total amount (the bill plus tip) for 10%, 15%, and 20% tips.
4. Pressing the clear button resets the bill amount to zero.

### What we'll do next:
We've received interest in using Core Data, a framework that allows us to store user data on the device. Therefore, we'll continue with our tip calculator app. We'll add a feature that will allow the user to select a tip amount. That total bill amount will be saved. The user will then be able to navigate to a different view in order to see all her saved data. We will display how much the user spent, when the expense occurred, and keep a running total of her expenses. In this way, the user will easily be able to see how much she is spending over time.

### How you can prepare:
##### If you did not attend the previous WWC meetups for iOS at Coding Dojo, please clone this repo and familiarize yourself with the code here.

If you did attend the previous WWC meetups for iOS at Coding Dojo, you may either clone this repo, which should be very similar to the code you wrote, or you may continue to build off your own code.

*If you would like to continue developing your own code, make sure you have Core Data in our project.* If you started your project with Core Data you already have it!

*How do I know if I already have Core Data in my project?*

To know whether or not you already have Core Data in your project, see if you have a file on the same level as your storyboard with the .xcdatamodeld extension. If you have this file, you already have Core Data and no action is necessary!

*How do I add Core Data if I don't have it in my project?*

If you do not have a file with the .xcdatamodeld extension, please follow these steps very carefully:

1.  Open your AppDelegate.swift file and add the following statement at the top:
```swift
import CoreData
```
2. Go to File > New > File
3. Under the iOS section, select Core Data and add a new Data Model
4. Name the Data Model "Tipster".
5. Confirm that you now have a file in your project named "Tipster.xcdatamodeld"
6. Go back to your AppDelegate.swift file and add the following code at the bottom of the class, *inside the last bracket.*
```swift
// MARK: - Core Data stack
lazy var persistentContainer: NSPersistentContainer = {
  /*
  The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
  */
  let container = NSPersistentContainer(name: "Tipster")
  container.loadPersistentStores(completionHandler: { (storeDescription, error) in
    if let error = error as NSError? {
     // Replace this implementation with code to handle the error appropriately.
     // fatalError() causes the application to generate a crash log and terminate. You should not use this               function in a shipping application, although it may be useful during development.
     /*
       Typical reasons for an error here include:
          * The parent directory does not exist, cannot be created, or disallows writing.
          * The persistent store is not accessible, due to permissions or data protection when the device is locked.
          * The device is out of space.
          * The store could not be migrated to the current model version.
          Check the error message to determine what the actual problem was.
     */
     fatalError("Unresolved error \(error), \(error.userInfo)")
    }
  })
return container
}()
// MARK: - Core Data Saving support
 func saveContext () {
   let context = persistentContainer.viewContext
   if context.hasChanges {
      do {
          try context.save()
      } catch {
           // Replace this implementation with code to handle the error appropriately.
           // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
           let nserror = error as NSError
           fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
 }
 ```
 7. Add the following line *inside* the "applicationWillTerminate(application: UIApplication)" method of AppDelegate:
 ```swift
 self.saveContext()
 ```
At this point, you should have Core Data ready to go! If you have any trouble rebuilding your project, double check and make sure you added everything correctly to AppDelegate.swift. If you are certain you have no errors there, go to Product > Build For > Testing. If it still doesn't build after that, double check AppDelegate.swift again and make sure the name of your Data Model (the file with the .xcdatamodeld extension) is "Tipster". It must match the name you included in AppDelegate.swift in the following line:
```swift
let container = NSPersistentContainer(name: "Tipster")
```
[This YouTube video will walk you through adding Core Data to your project](https://youtu.be/4nhAHj0lO7o)

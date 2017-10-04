



### Data Requirements :white_check_mark:

---

- [X] Your data set should contain 10 objects, each consisting of 2 strings and an image.
- [X] This data should be stored is a custom class that inherits from NSObject
- [X] An array of this data should be displayed in both the phone and watch apps

---

### An phone app with a UITableView of 10 items

---

- [X] All that needs to be displayed here is the first text label (no need for a custom cell).
- [X] This phone app is the central data point. All the strings and images  should only be a part of this app, not the watch app.
- [X] The phone app must respond correctly to the handleWatchKitExtensionRequest method and pass the array of objects to the watch.

---

### A watch app with a Table of the same 10 items

---

- [X] The 10 rows must display the image for each item only
- [X] Tapping the row should take the user to another interface controller that displays both strings
- [X] The watch app must use the openParentApplication method to obtain all of it's data.

    *Hint: The UIImagePNGRepresentation method is your friend*




# Project 5 - Saving data / table views

For this project, I implemented a standard UITableView and a single UIViewController. The user can enter a string into
the text field at the top of the view. Upon clicking the "+" button, the field is parsed and converted to an Int. If the
value is not an Int, then the function returns, otherwise, the Int will be added to an integer array in a static globals class.
The data in this Globals class is used as the data source for the UITableView. Users can also clear the data or delete at a specified index in the Globals class, which will update the table.

The first day of working on the project I added the UI elements, and added the basic protocol functions for a UITableView data source/delegate. The following day I implemented the Globals class, and added the logic for the table itself. Lastly, I realized that I forgot to add the running total label.

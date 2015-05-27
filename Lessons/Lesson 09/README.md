# Lesson 09 - Table Views

## Learning Objectives

* Know what it means to "meet a protocol," first look at the "delegate" pattern.
* Deploy table views without a UITableViewController.
* Customize table view cells.
* Implement passing data from one scene (View Controller) to another.

## Lesson Plan

### Review Arrays and Dictionaries

15 min

* What is an array? Why are they useful? How to use them.
* What is a dictionary? Why are they useful? How to use them.

### Core Material

30 min

What happens when we add a Dog to the table from last class?

Generally:

* Show modal
* User enters data
* Create a Dog instance
* Add the Dog to the Array in the *other* view controller.
* Tell the table to update


### Referencing

Dog and owner example (Person)

### Protocols

What's a protocol? How are they used?

It's a contract between two classes, so one class "knows" what it can do to an instance it has.

### Segues

A segue is also an instance of a class.

We can "trigger" them from code. But also they know the View Controllers involved in a transition from one Scene to another.

### Casting

Sometimes code is written in a generic way by Apple since they can't know what classes we're going to create.

Casting lets us treat one instance of a generic type as an instance of a specific type.


### Table View Example - Todo List - I DO

45 min

Step through creating an app with a table view. We're going to use the Delegate/DataSource pattern so as to support more complex views.

### In-Class Code-Along - WE DO

45 min

Try that yourself with the goals on the screen.

### In-Class Exercise - YOU DO

45 min

* Change to a Task class.
* Add properties to the task class and add UI to populate those values.
* Make it editable.

### Homework Exercises for Practice

#### Arrays

Lesson 09 - Arrays Practice.playground

#### Dictionaries

Lesson 09 - Dictionaries Practice.playground

#### Table Views

Lesson 09 - Table View Practice project


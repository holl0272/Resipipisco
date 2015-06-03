Lesson 13 - Introduction to Auto Layout

# Learning Objectives

* Distinguish between Springs-and-Struts and Auto Layout.

* Define what a "constraint" is and how we apply them to views.

* Devise layouts using Auto Layout and Interface Builder.

* Distinguish very clearly the differences between frame and constraint bounds.

# Lesson Plan

## Review of UIViews and their hierarchy

* UIView = rectangular area with an origin (x, y) and size (width, height)

## Springs and Struts

* Strut = margin, doesn't move

* Spring = width or height, moves and stretches

* Advantages = simple, works for majority of cases

* Disadvantages = doesn't accommodate different device sizes or orientations well

## Auto Layout

Auto Layout is a complex, general constraint system for layout out interfaces. While the name includes "Auto," making it sound easy and automated, this is quite the misnomer. It's a very manual, often tedious process to set up even the simplest user interfaces, and some types of many-element interfaces (like keyboards), can become nearly impossible to get right, unless great care is taken in their configuration.

* What is it?

* "Auto Layout" is a misnomer. The setup is quite manual.

* Works on the idea of a "constraint" plus a solver. It's a *generalization* of springs and struts.

* Constraints

    * First view

    * First attribute

    * Relation (e.g. "equal")

    * Second view

    * Second attribute

    * Multiplier

    * Constant

    * Priority (helps the solver "know" what's more important)

### Auto Layout Examples

2x2 centered "chessboard" grid

Small centered view containing two other views at 50% of the size of the parent.

3x3 Triplet

Things students must know how to do:

* Center a view inside another view

* Scale a view size with container, i.e. Set dependent width/height  w/ multiplier

* Set top/bottom/left/right constraints

* Tie leading/trailing, top/bottom from one view to another

* Set same width/height across several views

* Setting view/constraint presence depending on device type + proportion

### Understanding how constraint-based layout works

A whiteboard exercise for students to analyze and build layouts based on real apps or common paradigms.

* Drawings → constraints

    * Have students pick a layout or provide them with layouts

    * Determine what constraints

* Constraints → drawings

* Pair students and draw on the whiteboards.

    * Draw the UI first.

    * Draw lines that represent constraints.

* Describe constraints in English.

    * "The sidebar's width should be 25% of the total width."

* Build those interfaces in IB together, one person driving IB at a time.

## Auto Layout and Interface Builder

### Setting constraints in IB

Unfortunately, the UI provided by Interface Builder is not very friendly and is actually quite obtuse.

We have to be able to express:

1. What the first + second views are. The UI doesn't let us do this easily.

2. What relation we want between them.

Interface Builder displays the "solution" from computing constraints and the actual UI "frames" separately. You'll often see them out of sync, and this is okay.

Control-Drag + Context Menu

Control-drag in the canvas from one element another. This is *direction-dependent.* Dragging vertically gives you vertical constraints. Same for horizontal. Drag diagonally for both. Do the views you start and end on determine the "first" and "second" views, respectively? Nope.

Selection + Menu

Select two views in the document outline. Then use one of the menus in the lower-right to create constraints.

*Always check the constraints after creating them.* Interface Builder nearly always gets something wrong or creates extra constraints.

* Open the Inspector

* Double-click on the constraint

* Ensure that First and Second are the proper views (First depends on Second)

    * Mousing over the dropdown will highlight the view in the canvas

* Check the attributes

* Check the constant

* Check the multiplier (ratio format for 50% is "1:2")

Once you get the constraints corrected, use the "Update Frames" command to update the physical appearance of the view in IB to reflect what the constraints calculate.

### Accommodating different proportions

When creating apps, we often have to accommodate different sized screens in different orientations. For example, the calculator app shows a different interface when in landscape than when in portrait.

The Auto Layout UI in IB enables us to start specifying these different conditions.

* Page through the different size classes and orientations.

* Show it grays out in the document outline when changing size class to portrait.

* Show how adding a view in iPhone landscape makes that view appear only in landscape.


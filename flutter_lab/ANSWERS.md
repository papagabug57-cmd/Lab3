
Flutter Lab — Answers
Name: Abdul Rehman
Roll Number: 04072312041
Semester: 8th

A. Numeric Answers

A1: 24

A2: 11

A3: 6

A4: 14

B. Written Answers

B1. Which classes are Stateless and which are Stateful? Why?

`LabApp`, `HomePage`, `StudentCard`, and `GoalBanner` are StatelessWidgets because they display information based on their inputs and do not manage changing state internally.

`Tally`, `BuggyCounter`, and `Countdown` are StatefulWidgets because they manage changing values. `Tally` updates the count, `BuggyCounter` tracks clicks, and `Countdown` updates the remaining time. StatefulWidgets use a State object and `setState()` to rebuild their UI when state changes.

B2. Why must the Timer be cancelled in dispose()?

The Timer must be cancelled in `dispose()` because the widget may be removed from the widget tree while the timer is still running. Cancelling it prevents unnecessary background work and stops timer callbacks from trying to update a widget that has already been disposed. It also helps prevent resource leaks.

B3. Which widgets can be const, and what does const provide?

Widgets whose constructors and arguments use compile-time constants can be declared `const`, such as `StudentCard`, `GoalBanner`, `BuggyCounter`, or `Countdown` when their constructor arguments are constant. Constant widget instances can be reused rather than recreated unnecessarily, reducing object creation and helping Flutter optimize rebuilds. Widgets that depend on changing state or non-constant values cannot always be declared `const`.

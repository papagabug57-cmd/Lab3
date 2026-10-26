CS442 Week 7 — Team Board Flutter Lab

Name: Abdul Rehman  
Roll Number: 04072312041

A. Computed Answers

- A1: 35 seconds
- A2: 6 builds
- A3: 3 taps
- A4: 50%

B. Written Answers

B1. StatelessWidget vs StatefulWidget

A `StatelessWidget` is suitable for UI that does not manage changing state of its own, such as `Welcome`, `Probe`, `InfoPanel`, `SummaryRow`, `ShareRow`, `InfoBox`, and `StampStack`.

A `StatefulWidget` is suitable when the UI needs to update in response to changing state. In this lab, `Clock` manages the timer and build count, `Tile` tracks button taps, and `SwapBoard` manages the tile order.

B2. Widget, Element, and RenderObject

A Widget describes the configuration of part of the UI. An Element represents that widget's position and identity in the widget tree and can persist when the widget is rebuilt. A RenderObject handles layout, painting, and hit testing.

The `Probe` experiment shows that rebuilding can create a new widget configuration while the Element at the same location remains stable. The context also lets the Probe check its position in the tree and find an ancestor `Scaffold`.

B3. Constraints go down, sizes go up

Flutter's layout process sends constraints down the widget tree and sizes back up. In Step 7, wrapping each `SummaryRow` text in `Expanded` lets the row divide the available horizontal space among its children, preventing the original horizontal overflow. In Step 8, `Expanded` fills its allocated space, whereas `Flexible` allows its child to occupy less than the available space.

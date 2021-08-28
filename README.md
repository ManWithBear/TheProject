# TheProject

An ultimate pet project.

## Rules
1. Every Friday I publish a status update post.<br/>
I would argue my decisions, findings and experience. Check it out, maybe you will find something interesting or new for you. Or the other way around, you will find mistakes on my side (feel free to get in touch in this case, highly appreciated).

2. YOLO Driven Development.<br/>
No predefined architectures. Open minded approach. Solve problems when they appear. No overthinking and overengineering.

3. Start with UIKit with plans for SwiftUI in future.<br/>
For too long I was delaying giving a chance to SwiftUI. This project is not an exception.

4. ???

5. PROFIT

## Preamble
I enjoy crafting games. They give you a clear goal and a path to achieve this goal. But as your production tree grows it becomes difficult to keep track of everything that needs to be crafted, primitives to collect and small tasks to perform. The production tree can be dozens and dozens of intermediate products deep.

Let me show you an example:
To fix a broken bridge I need: 4 wooden planks and 2 nails. While I'm here I might as well build a mailbox that requires 2 wooden logs and 1 iron bar.
Processing 1 wooden log gives you 2 wooden planks. From 1 iron bar you get 4 nails.
So in total I need: 4 wooden logs and 2 iron bars.
But I already have 2 wooden planks and 1 nail from a previous crafting project.
Adding them into the equation results in 3 wooden logs and still 2 iron bars.

## What I would love to see in the app
1. Add / edit / remove ingredients.<br/>
An ingredient is a simple building block. Everything is an ingredient.

2. Define / edit / remove recipe.<br/>
Recipe defines the relationship between one ingredient (product of recipe) and a set of other ingredients.
For now for simplicity we would ignore possible recipe loops (when A made from B, but B could be made from A as well) and assume our production pipeline is [a rooted tree](https://en.wikipedia.org/wiki/Tree_%28graph_theory%29#Rooted_tree).

3. Create / edit / remove projects.<br/>
A project is a set of final recipes to perform.

4. Project summary.<br/>
Displays all intermediate recipes that need to be performed to finish the project. Allows you to specify which ingredients you already prepared and helps track progress.
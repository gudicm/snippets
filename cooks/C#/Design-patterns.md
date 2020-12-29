**DESIGN PATTERNS**
======

<details><summary> Singleton</summary>
<p>
 DEF: 
 restricts one instance of the class in a runtime.
 USAGE:
 for caches, thread pools, registries, centrilized logger
</p>
</details>

<details><summary> Factory</summary>
<p>
 DEF:
 creating object without exposing a creation logic. using common interface
 USAGE:
 when developer is not sure which type to construct
</p>
</details>

<details><summary> Builder</summary>
<p>
 DEF:
 creational pattern as Factory but used when it is require to do many thing in creating a object.
 
 PARTS:
 - Product
 - BuilderInterface
 - ConcreteBuilder(BuilderInterface)
 - Director(Controller)
  
 USAGE:
 when developer is not sure which type to construct

</p>
</details>

<details><summary> Adapter</summary>
<p>

 DEF:
 structural pattern as a bridge between two incompatible interface.
 USAGE:
- The client makes a request to the adapter by calling a method    on it using the target interface.
- The adapter translates that request on the adaptee using the      adaptee interface.
- Client receive the results of the call and is unaware of          adapter’s presence.
Client receive the results of the call and is unaware of adapter’s presence.

 PARTS:
 - Client
 - Target
 - Adapter
 - Adaptee
  

[diagram](https://www.tutorialspoint.com/design_pattern/state_pattern.htm)
</p>
</details>

<details><summary> State Pattern</summary>
<p>

 DEF:
 to describe the states of the object.
 USAGE:
 for the state machine
 PARTS:
 - Context
 - State(abstraction)
 - StartState
 - StopStart
  

[diagram](https://www.tutorialspoint.com/design_pattern/state_pattern.htm)
</p>
</details>

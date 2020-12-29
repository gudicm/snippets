**SOLID PRINCIPLES**
======
<details><summary> SRP(Single responsability principle)</summary>
<p>

    DEF1: 
    One class for one task. If we need to perform another interface we should implement another class

    DEF2:
    a class should have one, and only one, reason to change, meaning that a class should have only one job.
</p>
</details>

<details><summary> OCP(Open closed principle)</summary>
<p>

    DEF:
    be able to extend module behaviour without modifying it. 
    Can be done by using base class or inteface.
    "A software module/class is open for extension and closed for modification"
      

</p>
</details>

<details><summary> L(Liskov Substitution Principle)</summary>
<p>

    DEF:
    you should be able to use derived class instead parent and have it behave in same manner without modification.
</p>
</details>

<details><summary> I(Interface Segregation Principle)</summary>
<p>

    DEF:
    clients should not be forced to implement interfaces they don't use. Instead of one fat interface, many small interfaces are preferred based on groups of methods, each one serving one submodule.
</p>
</details>

<details><summary> D(Dependency Inversion Principle)</summary>
<p>

    DEF:
    - High-level modules should not depend on low-level modules. Both should depend on abstractions.
    - Abstractions should not depend on details. Details should depend on abstractions.

</p>
</details>
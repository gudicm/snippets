**C# 8.0 latest stable (official) version**
======

<details><summary>Access modifiers</summary>
<p>

public    - from same class, other class, same assembly, other assembly or other code
protected - from same class or from derived class
private   - from same class or struct
internal  - from same assembly 
protected internal - from the same assebly or from the derived classes
private protected - from current class or from derived classes within same assembly

</p>
</details>


<details><summary>ORM</summary>
<p>

- ADO 
- Dapper
- EF
- EF Core

</p>
</details>

<details><summary>Collection interfaces</summary>
<p>

- IEnumerable
  _when querying in-memory collection like Array, List_
  
- IQueryable 
  _when querying data from out-memory(like remote database, service)_
  **_check OData specification!!!_** 
</p>
</details>


<details><summary>Collections</summary>
<p>

- Array 
- ArrayList
- HashTable
- Queue
- Stack
- SortedList
- Tuple


</p>
</details>

<details><summary>Unit test frameworks</summary>
<p>

- xUnit         - Fact
- NUnit
- MSTest        - TestClass, TestMethod, ClassInitialize, ClassCleanup , TestInitialise ...

</p>
</details>

**TERMS**
======

<details><summary>Code inherintance</summary>
<p>
    
    It was supported inheritance by single base class and multiple interfaces
    
</p>
</details>

<details><summary>Polymorphism</summary>
<p>
    
    it is accomplish by unique interface, it enables to have many implementations for different classes.
    Response to method call will depend of object type in runtime.  

</p>
</details>



<details><summary>Interface</summary>
<p>

    Agrement how components should communicate with each other. By origin should only contain prototype of method. With C# 8.0 ver. feature of 'default interfaces' is available.
    Meaning that interface method could have concrete implementation.

</p>
</details>

<details><summary>Delegate</summary>
<p>

    Is POINTER to a function. Method to be delegated needs to have same signature as
    delegate , meaning same return type, type and number of func parameters.

    e.g
    // delegate declaartion
    delegate int MyDelegate(int n);

    // actual methods
    public static int AddNum(int p) {
         num += p;
         return num;
    }
    
    public static int MultNum(int q) {
         num *= q;
         return num;
    }
    ...
        MyDelegate myD1 = new MyDelegate(AddNum);
        MyDelegate myD2 = new MyDelegate(MultNum);

</p>
</details>


<details><summary>Reflection</summary>
<p>
    
    ability to retrieve aplication metadata during application 
    runtime

</p>
</details>

<details><summary>'static' keyword</summary>
<p>
    
    Static modifier can be applied on the class, field, method. If class is static all members of class needs to be also static. Static class cannot be instanciated.
    
    Static methods can access static and non-static variables, if accessing non-static variables, methods need to be called on instance.

    Static variable will be shared among all instances of class. 

</p>
</details>

<details><summary>Stateless vs Statefull objects</summary>
<p>
    
    example of stateless class is static class, only have calculation methods. Statefull object 
    are entity classes or business object  holding a context  

</p>
</details>

<details><summary>Abstract class</summary>
<p>

    it is not intended to be instanciated (but it can have constructor and members),
    it needs to have at least single 'abstract' method. 
    it is used for definition of Base class in class hierarchy

</p>
</details>

<details><summary>Sealed modifier</summary>
<p>
    
    Class declared as Sealed cannot be extended(inherited).
    Method declared as Sealed cannot be overriden.
      
</p>
</details>

<details><summary>Virtual modifier</summary>
<p>
   
    Virtual can be assign to a method or property, identifing that functionality can be ovveriden in derived class.
      
</p>
</details>


<details><summary>Tuple</summary>
<p>
    
    used when you want to have object that represents data structure but you dont want to defined type class or struct for it.

    e.g.
    Tuple<int, string, string> person =  new Tuple<int, string, string>(1,"Joe", "Doe");

    With static helper:
    var person = Tuple.Create(1, "Joe", "Doe");

      
</p>
</details>

<details><summary>Stack vs Heap</summary>

#### STACK

<p>

     - it is fast access memory, size is defined by OS,
     - stores local variables and function variables,
     - variables are declared, initialised and allocated during a runtime,
     - it is linear data structure, and varibles are stored in block, therefore cannot be fragmented
     - it is not possible to resize variable
     - CPU or process manages with allocation and deallocation of memory
     - faster, cost less, fixed size but can cause shortage of memory       

</p>

#### HEAP
<p>

    - it stores global variables and function signatures
    - it stores variables randomly as data structure, therefore fragmentation is possible
    - it supports dynamic allocation of memory, it can be resized
    - it is not tightly managed by CPU, it is free floating range of memory
    - allocation and deallocation of can be done with programming instructions
    - variables can be resized
    - gc operates on managed heap

</p>

[heap vs stack](https://www.guru99.com/stack-vs-heap.html)
</details>

<details><summary>Yield keyword</summary>
<p>

    will return IEnumerable object as result , but with yield state machine will be created
    for iteration. 

</p>
</details>

<details><summary>REST</summary>
<p>

    Representational state transfer software architecture style defines constraints for Web Services.

</p>
</details>

<details><summary>ODATA</summary>
<p>

    Open Data protocol for creation of queryable REST api

</p>
</details>


**DESIGN PATTERNS**
======

<details><summary>Dependency Injection</summary>
<p>

    - reduce a tight coupling between software components
    - example 'constructor injector' , reference to object via reference to interface

</p>
</details>

**C# 8.0 What's new?**
======


<details><summary>default interface</summary>
<p>

    - default interface method contains default implementation. 

</p>
</details>

<details><summary>async streams</summary>
<p>

    - enables async iteration over enumerable

</p>
</details>

<details><summary>async disposable</summary>
</details>

<details><summary>using declaration</summary>
<p>

    - with 'using' declaration directive is given to compiler that declared variable will be automatically dispose when next enclosing type is reached.
   
    e.g
    using var file = new System.IO.StreamWriter("Sample.txt");
    file.WriteLine("Hello world");    
    // file is disposed of here


</p>
</details>

<details><summary>advance pattern matching</summary>

</details>


<details><summary>readonly property</summary>
</details>

**GARBAGE COLLECTION**
======

Summary from [Garbage collection fundamentals](https://docs.microsoft.com/en-us/dotnet/standard/garbage-collection/fundamentals)

<details><summary> Definition </summary>
<p>
    
    GC is automatic memory manager that allocates and release application memory on managed heap section of memory.
    - frees developer of manualy release of memory
    - allocates object on heap efficiently
    - reclaims object no more used, clears its memory and keeps are memory for future allocation
    - provides memory safety making sure that object wil not use content of another

</p>
</details>

<details><summary> Virtual address space == Managed Heap </summary>
<p>

    Every process(application) has it own 'virtul address space'.  For:
    - 32 kbits machine it is 2GB
    - 64 kbits machine is is 8TB

    Virtual address space is 'Managed heap', and develooper interacts with it (not with
    physical memory directly) by uding GC or if writing native application when using native windows function to allocate or release variables(heap memory).

    Virtual address space can be divided into 3 states:
    - free,
    - reserved,
    - commited

 </p>
</details>

<details><summary> GC conditions </summary>
<p>

    When OS notifies GC about low physical memory or surplus heap threshold, GC calls 
    method 'GC.Collect()' whis releases heap memory base on managed heap criteria.  

</p>
</details>

<details><summary> GC algorithm </summary>
<p>
    
    GC takes in consideration following:
    - it is to compose heap section, rather then whole heap,
    - newly object has a shorter lifespan, that older objects,
    - newly objects tend to interact with each other, due to opinion that application acces new
    object around same time

    Due to this reasons GC divides heap to sections:
    - generation 0
    - generation 1
    - generation 2(oldest object, static data) 

    Size of short lived section(generation 0 and generation 1) depends of machine GC mode
    which can be configured within application config file, supported modes are:
    - workstation mode(default),
    - server mode 
     
</p>
</details>

<details><summary> Unmanaged HEAP </summary>
<p>

    Unmanaged heap is section of heap that stores object that will not be managed by GC,
    such as file handle, windows handle or network connection. Such object need to be release with explicitly implementation of dispose method or override of Object.finalize().     

</p>
</details>

<details><summary> Boxing and Unboxing </summary>
<p>

    Type system contains three data types: 
     - Value types(int, char, string), reference and pointer.

    BOXING is term which identifies cast of value type variable to reference type.
    e.g.
        int i = 123;
        // The following line boxes i.
        object o = i;      

    Boxing is expensive to memory performance because reference object is created as copy 
    of value object on managed heap.

    Unboxing is reversal process that cast a refernce object to value type, it is also expensive.
    1. it is checked if reference instance is boxed version of value type.
    2. Copying value fron instance to value type variable.

    e.g.
        int i = 123;      // a value type
        object o = i;     // boxing
        int j = (int)o;   // unboxing

</p>
</details>

**

**QUESTIONS?**
======

Check for more on:

[www.upwork.com](https://www.upwork.com/i/interview-questions/c-sharp/)

<details><summary>abstract class vs interface</summary>
<p>
   
    interface only can be used to define functionality, but abstract class can create (implement) functionality to be implemented or override by subclass. Class can extend only one abstract class
    but can implement several interfaces. 


</p>
</details>

<details><summary>difference Array vs  ArrayList vs List?</summary>
<p>
    
    Array is static and continuos in memory, is method of organizing data in memory
    List is dynamic and random , it is data structure that allows several operation on collection type(add, insert, remove,...) 
    ArrayList is alternative to Array, but it is NOT strongly typed and can accept any element, also can accept NULL values.

</p>
</details>

<details><summary>break s continue</summary>
<p>
    
    'Break' will interupt a loop and exit from the loop, while 'Continue' will only break current iteration and will continue with next iteration.


</p>
</details>

<details><summary>3 way to pass parameter to function?</summary>
<p>

    - as 'value' parameter
    - as 'reference' parameter (using ref keyword), method access memory location of ref parameter
    changes to parameter in function will affect initial context of parameter
    - as 'out' parameter, same as ref but 'out ' param data will be transfered from the function. 

</p>
</details>

<details><summary>difference between dynamic type params and object type variable?</summary>
<p>

    Dynamic variable type will be checked during runtime.  While object variable type will be
    checked during compiling.

    e.g.
    dynamic MyDynamicVar = 1;
    Console.WriteLine(MyDynamicVar.GetType()); 

</p>
</details>

<details><summary>explain encapsulation?</summary>
<p>

    It is grouping code into logical packages, purpose is to reduces coupling beetwen software  components and to encourage code reusability. It is done using 'access modifiers'(specifiers).

</p>
</details>

<details><summary>role of struct?</summary>
<p>

    struct is for a record type. if all record members are value types and object is short-lived  than it makes a sense.
    to define object as struct. Such instance will be allocated and deallocated on stack, in difference to class instance.


</p>
</details>
    

[17 essential interview .NET questions](https://www.upwork.com/i/interview-questions/c-sharp/)

<details><summary>diff between class and object</summary>
<p>

    class describes template definition of the object, while object is instance of the class and it actual variable


</p>
</details>

<details><summary>difference  while and for variable</summary>
<p>

    both loops are used for repetive task. 'for' loop will be used when we know number of repetions, 'while'
    will be used in situation when task needs to be repeated until condition is fullfiled.


</p>
</details>

<details><summary>diff  boxing and unboxing</summary>
<p>

    in upper section


</p>
</details>

<details><summary>diff between constans and read only variables</summary>
<p>

    Constans are evaluted during compile time, while readonly varibles are evaluated during runtime
    Constants holds only value-type , readonly variable can hold reference type
    Constanst should be used when value is not changed during runtime, read-only are used when their value is
    not know before runtime.
    Read - only can be initialized during declaration or in constructor 


</p>
</details>

<details><summary>LINQ</summary>
<p>

    'Language Integrated Query' is set of feature of .NET framework which extends query capabilities on supported datasources
    (Collections, SQL Databases, ADO.NET Datasets, XML documents, and any collection implementing IEnumerable interface ).
    LINQ bridges a gap between object and data.



</p>
</details>

<details><summary>What is a delegate?</summary>
<p>

    in section above.

</p>
</details>

<details><summary>generic action in WebAPI?</summary>
<p>

    not posssible WEB API runtime needs a method signature in advance.

</p>
</details>


<details><summary>interface access modifier?</summary>
<p>

    inteface is always PUBLIC.

</p>
</details>


<details><summary>.NET acronyms: IL, CIL, MSIL, CLI and JIT </summary>
<p>

    IL  - intermediate language,
    JIT - just in time compiler ,
    CIL - common intermediate language
    MSIL- Microsoft Common language 

    When code is compiled it translated to CLI byteorder assembly(.exe or .dll). When CLI assembly is run JIT
    will translate CLI code to native code for machine.

</p>
</details>

<details><summary>break with nested 'for' loops ?</summary>
<p>

    when 'break' is call within nested loops, it will berak only inner loop. 

</p>
</details>

<details><summary>LINQ deffered and immediate execution</summary>
<p>

    Deffered execution is when variable is set with LINQ query, but query will not be executed,
    before next iteration over the collection.
    Immediate query execution is done when calling methods like Sum(), Average(), Count(), ToList(), ToArray().  

</p>
</details>


<details><summary>System.Object and its methods</summary>
<p>

    Base type for .NET classes, important methods are:
    - ToString();
    - Equals(),
    - Finalize(),
    - GetType(),
    - GetHashCode()


</p>
</details>

**SOLID PRINCIPLES**
======
[medium article](https://medium.com/@mirzafarrukh13/
solid-design-principles-c-de157c500425)

<details><summary> SRP(Single Responsibility Principle) </summary>
<p>

    One class should be responsible for one task. if we need to perform another task write a another class for it.
     
</p>
</details>
<details><summary> OCP(Open Closed principle) </summary>
<p>

We should strive to write a code that should not be changed every time the requirement is changed. 
Way to accoplish it is you base class for common definition.
     
</p>
</details>



 ## collapsible markdown?


<details><summary>CLICK ME</summary>
<p>

#### yes, even hidden code blocks!

```python
print("hello world!")
```

</p>
</details>   

- pool pattern,
- usage of streams,
- large heap objects( with streams ),
- put(update) and post(create), 
- rcp for calculation,
- Configure.await();
- CancelationToken, through timespan;

- angular observable merge, 
- C# reactive programming

// KEYWORDS

// delegate, similar to a pointer in C, in C# holds a reference to a method , used to implemen events and callbacks

// KEYWORDS
                     


// OPERATORS
//?		-> if condition true returns first expression
condition ? first_expression : second_expression;  
//??	-> if first <> null then return first, otherwise return second
condition ?? first_expression : second_expression;  
int y = x ?? -1;

// OPERATORS

// CURRENT PATH OF PROJECT, APP
AppDomain.CurrentDomain.BaseDirectory	// for unit tests
Assembly.GetEntryAssembly().Location	// assembly
System.Reflection.Assembly.GetEntryAssembly().Location; // assembly

// CURRENT PATH OF PROJECT, APP

// ANONYMOUS TYPES 
// class
var v = new { Amount = 108, Message = "Hello" };  

// ANONYMOUS TYPES 

/// generic types
// for geneneric return type from function use keyword <object> or <dymamic>
public object GetGenericPerson(int id, string first, string last, string addr,int age)
        {
            return new Person()
            {
                FirstName = first,LastName = last,Id = id,Address = addr,Age = age
            };
        }

// with <object> it is required to use casting when initialising return type, with <dynamic> it is required to reference Microsoft.CSharp.RuntimeBinder 		
/// end generic types

// DB Connection libraries

// Ado entity - oldest and fastest, overhead with implementation

// Entity Framework - DbContext, CRUD generator
// EFCore - for Core		 
// Dapper -	 mini ORM, most suitable for DB strong developers, serialization to arrays and Lists 

// DB Connection libraries

// Collection
// IEnumerable and IQueryable are used for data manipulation in LINQ from the database and collections.
// IEnumerable  are for in memory collections
// IQueryable are for colection to be retrieved with remote call to db 
// Collections 


// ENTITY FRAMEWORK
// generate ADO
//	table -> new ADO -> Code First from DB
// procedure ->new ADO -> 
// ENTITY FRAMEWORK

//Logger 

/// LOG4NET
///GUI
/// SCSF ((Smart client software framework)

/// Container hierarchy , basic container for various modules to be loaded
/// startup project <Shell>
public class Program : FormShellApplication<WorkItem, Form1>

/// for each module separate project, module can ebe loaded as standalone.

/// loading of the module in main container is defined over config xml or app config¸ 
/// example ProfileCatalog.xml
<?xml version="1.0" encoding="utf-8" ?>
<SolutionProfile xmlns="http://schemas.microsoft.com/pag/cab-profile">
  <Modules>
    <ModuleInfo AssemblyFile="Red.exe" />
    <!-- <ModuleInfo AssemblyFile="Blue.exe" />-->
  </Modules>
</SolutionProfile>

/// DEPENDENCY INJECTION
// basic example is with app property, defining common IDependency interface with Strategy pattern and 
// loading runtime assembly by app property
// dependency interface
public interface IDependentClass
    {
        void DoSomethingInDependentClass();
    }

 // class to be injected	
 public class DependentClass1 : IDependentClass
    {
        public void DoSomethingInDependentClass()
        {
            Console.WriteLine("Hello from DependentClass1: I can be injected into MainClass");
        }
    }	
	
// container class
public class MainClass
    {
        IDependentClass dependentClass;
        public IDependentClass DependentClass { get { return dependentClass; } set { dependentClass = value; } }
 
        public void DoSomething()
        {
            dependentClass.DoSomethingInDependentClass();
        }
    }
 
// app settings for injected class
<appSettings>
    <add key="ClassName" value="DependencyInjection.DependentClass1" />
  </appSettings>

// loading of dependecy injection according to property defined in app.config
        static IDependentClass GetCorrectDependency()
        {
            string classToCreate = System.Configuration.ConfigurationManager.AppSettings["ClassName"];
            Type type = System.Type.GetType(classToCreate);
            IDependentClass dependency = (IDependentClass)Activator.CreateInstance(type);
            return dependency;
        }  
// Type of dependecy injection in the CAB
//	ComponentDependency(string Id)
//	ServiceDependency  [annotation]
[ServiceDependency]
        public WorkItem ParentWorkItem
        {
            set { parentWorkItem = value; }
        }

// CreateNew 
 [CreateNew]
        public Component1 Component12
        {
            set { component12 = value; }
        }
	// adding
	protected override void AfterShellCreated()
        {
            RootWorkItem.Items.AddNew<Component1>("FirstComponent1");
            Component2 component2 = new Component2();
            RootWorkItem.Items.Add(component2);
            DisplayRootItemsCollection();
        }
		
/// DEPENDENCY INJECTION
/// WorkItem
// container for runtime components that are collaborating case, most important are  Services, Items(System.Objects), WorkItems(collection of child WorkItems)

/// WorkItem

/// SMARTPARTS
// most easily thought as user control in CAB project
/// SMARTPARTS


/// SCSF ((Smart client software framework)
///GUI

/// WEBAPI
// routing (WebApiConfig.cs)
routes.MapHttpRoute(
    name: "API Default",
    routeTemplate: "api/{controller}/{id}",
    defaults: new { id = RouteParameter.Optional }
);		
// ASYNC PROGRAMMING 
// to be used when app needs parallel processes(threads) to be run with no interruption.
// api controller should be responsive and scalable, to be responsive use <Task> interface, to be scalable use asynch programming(async/await)
// when implementing async controllers start from inside code to outer layer, it means implement asynchrony when accesing DB or files and at the end implement asynchronity at controller method   
// ASYNC PROGRAMMING

/// LAZY LOADING
/// concept od delaying object initialisation to point where you need it 
// 
Lazy<Orders> _orders = new Lazy<Orders>();
///it is possible to implement lazy loading using inteface implementation on object
/// END LAZY LOADING


/// WEBAPI

/// DDD(DOMAIN DRIVEN DEVELOPMENT)
// entity - object that has unique identity within system, identity is most often defined with unique ID, objects like Customer, Product,
// value object - do not have unique identity and they are defined by state of attributes, 2 value objects are same if all attribs are equal
// value object - are immutable(for user) in application, e.g. price of product
// nouns - should be entity and value objects
// verbs - should be actions on nouns
// aggregates - products that live and die to together (card in web shop, related to List of Items, each Item is defined with product, price and quantity)
/// DDD(DOMAIN DRIVEN DEVELOPMENT)

/// visual studio code shortcuts
//	prop			- define property  				- string name {get;set;}
//  ctor			- default constructor
//	itar			- for loop for array
//	 			
//	try				- try/catch block				
/// visual studio code shortcuts



/// ACCESS MODIFIERS
private - The type or member can be accessed only by code in the same class or struct.

protected - The type or member can be accessed only by code in the same class, or in a class that is derived from that class.
internal - The type or member can be accessed by any code in the same assembly, but not from another assembly.
protected internal - The type or member can be accessed by any code in the assembly in which it is declared, or from within a derived class in another assembly.
private protected - The type or member can be accessed only within its declaring assembly, by code in the same class or in a type that is derived from that class./// ACCESS MODIFIERS

// REFLECTION
// ability to query metadata of the application during a runtime
// simple
var a = getObject();
Console.Out.WriteLine(a.GetType());

/// NET.CORE WEBAPI

/// NET.CORE WEBAPI

/// WFC SERVICES///
// windows service project template
// ProjectInstaller.cs	-> InitializeComponent func()	-> define security on service and define service properties(name, description)
// Service class	-> actual service implementation
// it is possible to log events from service to event manager 
/// WFC SERVICES///

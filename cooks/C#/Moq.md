#### Mocking 
in testing process, when feature or component is isolated in order to be tested, and when testing object have dependency for required test, mocking is emulation of dependency in order to execute test  with emulated dependency instead of real.

Tests with mocking are performed in test steps:
- arrange(setup)
- act(call to a functionality to be tested)
- assert(verify test results)

#### MOQ
_using Moq;_

Instanciate mocked object:

      Mock<IFrequentFlyerNumberValidator> mockValidator = new Mock<IFrequentFlyerNumberValidator>();

Send a mocked object as **reference**:

```
   var sut = new CreditCardApplicationEvaluator(mockValidator.Object);

```
Setup for method of **mocked object** in order to predefined return value for input params:

    mockValidator.Setup(x => x.IsValid("x")).Returns(true)

Argument matching for the setup:

        //mockValidator.Setup(x => x.IsValid("x")).Returns(true);
        //mockValidator.Setup(x => x.IsValid(It.IsAny<string>())).Returns(true);
        //mockValidator.Setup(x => x.IsValid(It.Is<string>(s=>s.StartsWith("x")))).Returns(true);
        mockValidator.Setup(x => x.IsValid(It.IsRegex("[x,y]"))).Returns(true);

To define default behaviour of mocked component:

    mockValidator.DefaultValue= DefaultValue.Mock;`

To setup tracking changes of mocked object property use syntax:

    mockValidator.SetupProperty
    (x => x.ValidationMode);
    // for all properties of mocked object
    mockValidator.SetupAllProperties
    ();

#### State Based  vs Behaviour Verification test test

In mocking we create test, arrange a mocked object, create SUT object with mocked object as depedency and act(call a method) under a SUT.
**State test** checks the result of method or property state of the SUT.

**Behaviour test** in difference checks the mocked object, for example if certain method of the mocked object is called or if property is accesed. 

To verify if mocked object method is call use:

    // moq method accepts any string 
    mockValidator.Verify(x => x.IsValid(It.IsAny<string>()));

To verify exact number of calls to mocked object method :

    //mockValidator.Verify(x => x.IsValid(It.IsAny<string>()), Times.Exactly(2));
    mockValidator.Verify(x => x.IsValid(It.IsAny<string>()), Times.Never);

To check invocation of property of mocked object, syntax should be used:

    // for getters
    mockValidator.VerifyGet(x => x.ServiceInformation.License.LicenseKey, Times.Once);
    // for setters
    mockValidator.VerifySet(x => x.ValidationMode = It.IsAny<ValidationMode>(), Times.Once);       

Setup excepted exception from mocked object method:

    mockValidator.Setup(x => x.IsValid(It.IsAny<string>()))
                    .Throws(new Exception("Custom message"));

Mock setup for generic types:

    mockValidator.Setup(x => x.IsOdd(It.IsAny<It.IsAnyType>())).Returns(true);

Mocking of async values: 

    public interface IDemoInterfaceAsync{
        Task StartAsync
        Task<int> StopAsync
    }
    var mock = new Mock<IDemoInterfaceAsync>();
    mock.Setup(x => x.StartAsync ()).Returns(Task.CompletedTask);
    mock.Setup(x => x.StopAsync ()).Returns(Task.FromResult(42));
    mock.Setup(x => x.StopAsync ()).ReturnsAsync(42);

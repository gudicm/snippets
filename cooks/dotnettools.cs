// dotnet - tool for managing a .NET source code AND BINARIES 
dotnet --info		-- core version installed
dotnet --help

dotnet new [template-name] --name [project-name]
dotnet new console --name MyFirstApp
dotnet add package [package]
dotnet restore
// dotnet util

// sc	-- for communication with the Service Control Manager and services 
sc create [service-name] binpath=[full-path-to-service-exe]
sc start [service-name]
sc delete [service-name]
// sc

// c# net tools
c:\Program Files (x86)\Microsoft SDKs\Windows\v8.1A\bin\NETFX 4.5.1 Tools\x64\xsd xml_file 


// xml to xsd
xsd invoice1.xml /outputdir:outDirXsd
xsd invoiceEu.xml /outputdir:outDirXsd
xsd invoiceGradjevina.xml /outputdir:outDirXsd

// xsd to stream class
xsd invoice1.xsd /classes /namespace:SaopSwagger
// multiple classes
xsd invoice1.xsd invoice1_app1.xsd /classes /namespace:SaopSwagger



// CORE.API
Scaffold-DbContext "Server=IT-27105\SQLEXPRESS;Database=BookStoreCodeMaze;Trusted_Connection=True;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models
// with force flag
Scaffold-DbContext -force "Server=IT-27105\SQLEXPRESS;Database=BookStoreCodeMaze;Trusted_Connection=True;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models
// schema
Scaffold-DbContext "Server=IT-27105\SQLEXPRESS;Database=AdventureWorks2016CTP3;Trusted_Connection=True;" Microsoft.EntityFrameworkCore.SqlServer -Schemas HumanResources -OutputDir Models

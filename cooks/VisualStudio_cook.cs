// SHORTCUTS
// format 					ctrl+k, ctrl+f
// comment					ctrl+k, ctrl+c
// uncomment				ctrl+k, ctrl+u

// SHORTCUTS

// DEBUGGING
	Watch					monitor locals and auto values
	QuickWatch				posibility to evaluate and re-evalute variables and objects while process in debug mode 
// DEBUGGING


// NU GET CONSOLE
// install
Install-Package Nunit -Version

# Show specific packages (all versions of NuGet)
Get-Package -ListAvailable -Filter elmah
Get-Package -ListAvailable -Filter Logging

# List all versions of packages matching the filter "jquery"
Get-Package -ListAvailable -Filter jquery -AllVersions

# List the top 100 packages
Get-Package -ListAvailable -PageSize 100


# Find-Package in NuGet 3+ is more efficient than Get-Package
Find-Package elmah
Find-Package Logging

# List packages with the keyword EntityFramework and version 6.1.1
Find-Package EntityFramework -version 6.1.1

# List all versions of the package with the ID of "jquery"
Find-Package jquery -AllVersions -ExactMatch 
// NU GET CONSOLE
# BPhishTest
This repo is designed as a test for wrangling bogus user data from csv, json and sql formats, as a preventative test. The code is written in C# with Microsoft Visual Studio Community 2022 as a Console App.

## Dependencies
- CsvHelpder 33.0.1
- MySql.Data 9.3.0
- NewtonSoft.json 13.0.3

## Helper webs
- Json class inferance was done using [JsonToC#](https://json2csharp.com/)
- Csv Mapping code extracted and modified from [Bradley Wells Csv Mapping and Import](https://wellsb.com/csharp/learn/read-csv-dotnet-csvhelper)


## Notes
The code will work to process the given raw data files in the RawDataFiles folder into Lists of User Classes for the csv and json files and into a MySql adatabase for the sql file.
There are three data import and wrangling classes, all called from the Program.cs file for speed.

## To do with more time
- All 3 sets of data could be converted to datasets or mapped using class mappings, as was done with the CsvUserClassMap method on CsvUser classses
- Once data mapping is done, extract all data into csv.output.josn master class. The benefit of the json schema is that all fields can be null and the usefullness of rows would depend on the rules chosen for different requirements
- Add a standard logger for error handling and reporting
- Take all code out of Program except call to governor new class
- Generate abstract Interfaces for classes and methods
- Apply the 5 SOLID design pricniples: Separate classes and methods and add interfaces: Single responsibility principle, Liskov subsitution principle, Open/Closed principle, Interface segregation principle and Dependency Inversion Principle
- Investigate whether the new .NET json wrangling libraries can do the json wrangling without using NewtonSoft.Json, which I have found preferable last time I did this

  
## Questions
 - Although C# can be used to ingest raw data quite quickly, for large files containing millions or even billions of records, I would use the Bulk Insert command funcionality available in most database providers. Bulk Insert is the fastest way to get data into tables in the first place. After the data is inserted with Bulk insert, a set of procedures and data cleansing exercises can be used to validate, report on and filter data.

- Where data contains errors (such as missing passwords or incorrect email formats), Sql scripts could be used to flag data rows where such errors occur. That would be my preferred method. An examle of this is shown in the ExecuteSql method of the MySqlImporter class. Here, the user_login_history table is queried, to select rows where 'failure_reason' is not NULL. To do this successfully, you would have to know what data is essential. A missing or incorrect password or failed login using the ingested and cleansed data could set a flag against the user, so that only viable users are extracted in the final output.

## Output from successfull run of code
Importing Users from 'users.json'

Users imported: 48

Runnning MySql script, converted for Windows from 'users.sql' => 'usersWinFromLinux.sql'

User Logins added: 75

Failed user Logins:
        user_id: 4      failure_reason: Invalid password
MySql data imported and user logins checked successfully.

CSV data imported and List containing 2500 CsvUser classes created successfully.



  

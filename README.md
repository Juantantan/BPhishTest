# BPhishTest
This repo is designed as a test for wrangling bogus user data from csv, json and sql formats, as a preventative test. The code is written in C# with Microsoft Visual Studio Community 2022 as a Console App

## Dependencies
- CsvHelpder 33.0.1
- MySql.Data 9.3.0
- NewtonSoft.json 13.0.3

## Notes
The code will work to process the given raw data files in the RawDataFiles folder into Lists of User Classes for the csv and json files and into a MySql adatabase for the sql file.
There are three data import and wrangling classes, all called from the Program.cs file for speed.

#To do
- All 3 sets of data could be converted to datasets or mapped using class mappings, as was done with the CsvUserClassMap method on CsvUser classses 
- Add a standard logger for error handling and reporting
- 
#Questions
 - Although C# can be used to ingest raw data quite quickly, for large files containing millions or even billions of records, I would use the Bulk Insert command funcionality available in most database providers. Bulk Insert is the fastest way to get data into tables in the first place. After the data is inserted with Bulk insert, a set of procedures and data cleansing exercises can be used to validate, report on and filter data.

- Where data contains errors (such as missing passwords or incorrect email formats), Sql scripts could be used to flag data rows where such errors occur. That would be my preferred method. An examle of this is shown in the ExecuteSql method of the MySqlImporter class.



  

using BoxPhishTest.Classes;

/// <summary>
/// For speed, main data wrangling classes are called directly from here. We are not using SOLID design methodology or interface classes
/// Uses https://json2csharp.com/ online Json tools to infer class model
/// Uses https://wellsb.com/csharp/learn/read-csv-dotnet-csvhelper
/// </summary>

bool Success = false;

// Import and validate JSON data against schemna
Console.WriteLine($"Importing Users from 'users.json'\n");
JsonImporter jsonImporter = new JsonImporter();
List<JsonUser> users = jsonImporter.GetUsersFromJson();
Console.WriteLine("Users imported: {0}\n", users.Count);

// Import and validate MySql database, table creation. Read user login failed attempts, if any
Console.WriteLine($"Runnning MySql script, converted for Windows from 'users.sql' => 'usersWinFromLinux.sql'\n");
MySqlImporter mySqlImporter = new MySqlImporter();
Success = await mySqlImporter.ExecuteSql();
if (Success)
{
    Console.WriteLine($"MySql data imported and user logins checked successfully.\n");
}
else
{
    Console.WriteLine("MySql users data import failed.\n");
}

// Import csv data from file 'users.csv'
CsvImporter csvImporter = new CsvImporter();
List<CsvUser> csvUsers = csvImporter.GetCsvUsers();
int csvUserCount = csvUsers.Count;
if (csvUserCount > 0)
{
    Console.WriteLine("CSV data imported and List containing {0} CsvUser classes created successfully.", csvUserCount);
}
else
{
    Console.WriteLine("CSV users data import failed.");
}

// We have created List objects of users from both the given Json and CSV raw data files
// We have also created a set of tables in MySql from the users.sql script: [users], [user_login_history], [user_settings].
// The data in our Lists and database doesn't match the csv.output.json file
// By mapping the data from these sources into the output json format, where mappings and data are available, we can create a unified output
//     for all our data and export it to a csv copnforming to the schema: 'csv.output.json'.
// 





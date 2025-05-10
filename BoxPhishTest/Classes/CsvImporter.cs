using System.Globalization;
using BPhishTest.Interfaces;
using CsvHelper;

namespace BoxPhishTest.Classes
{
    /// <summary>
    /// Class containing Method GetCsvUsers to generate List of CsvUser classes
    /// </summary>
    internal class CsvImporter: ICsvImporter
    {
        string csvUsersPath = Path.Combine(Environment.CurrentDirectory, "RawDataFiles", "users.csv");

        /// <summary>
        /// Import CSV data from file 'users.csv' into List of CsvUser classes, mapped to CsvUserClassMap using CsvHelper library
        /// </summary>
        public List<CsvUser>GetCsvUsers()
        {
            using (var reader = new StreamReader(Path.Combine(Directory.GetCurrentDirectory(), csvUsersPath)))
            using (var csv = new CsvReader(reader, CultureInfo.InvariantCulture))
            {
                csv.Context.RegisterClassMap<CsvUserClassMap>();
                List<CsvUser> csvUsers = new();
                var isHeader = true;
                while (csv.Read())
                {
                    if (isHeader)
                    {
                        csv.ReadHeader();
                        isHeader = false;
                        continue;
                    }
                    else
                    {
                        csvUsers.Add(csv.GetRecord<CsvUser>());
                    }
                }
                return csvUsers;
            }
        }
    }
}

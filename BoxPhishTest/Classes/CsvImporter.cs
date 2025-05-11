using System.Globalization;
using BPhishTest.Interfaces;
using CsvHelper;

namespace BoxPhishTest.Classes
{
    internal class CsvImporter: ICsvImporter
    {
        static readonly string csvUsersPath = Path.Combine(Environment.CurrentDirectory, "RawDataFiles", "users.csv");

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

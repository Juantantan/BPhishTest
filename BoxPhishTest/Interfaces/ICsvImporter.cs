using BoxPhishTest.Classes;
namespace BPhishTest.Interfaces
{
    /// <summary>
    /// Interface for CsvImporter class
    /// </summary>
    internal interface ICsvImporter
    {
        /// <summary>
        /// Import CSV data from file 'users.csv' into List of CsvUser classes, mapped to CsvUserClassMap using CsvHelper library
        ///     real_name is retained and should be removed. CsvHelper library can map these fields directly once override methods are understood.
        ///     This would be a better solution making full use of CsvHelper library.
        /// </summary>
        List<CsvUser> GetCsvUsers();
    }
}

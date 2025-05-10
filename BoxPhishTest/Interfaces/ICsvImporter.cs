using BoxPhishTest.Classes;

namespace BPhishTest.Interfaces
{
    /// <summary>
    /// Interface for CsvImporter class
    /// </summary>
    internal interface ICsvImporter
    {
        List<CsvUser> GetCsvUsers();
    }
}

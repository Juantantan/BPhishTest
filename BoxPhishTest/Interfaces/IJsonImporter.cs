
using BoxPhishTest.Classes;

namespace BPhishTest.Interfaces
{
    /// <summary>
    /// Interface for JsonImporter class
    /// </summary>
    internal interface IJsonImporter
    {
        List<JsonUser> GetUsersFromJson();
        bool ValidateJson(string jsonString);
        List<JsonUser> ImportJson(string json);
    }
}

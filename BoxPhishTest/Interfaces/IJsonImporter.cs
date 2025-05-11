
using BoxPhishTest.Classes;

namespace BPhishTest.Interfaces
{
    /// <summary>
    /// Interface for JsonImporter class
    /// </summary>
    internal interface IJsonImporter
    {
        /// <summary>
        /// Method to get Users from Json file. 
        ///     Creates serializable Json string
        /// </summary>
        List<JsonUser> GetUsersFromJson();

        /// <summary>
        /// Method to validate Json string against given json schema: 'csv.output.json'
        ///     Creates serializable Json string
        /// </summary>
        bool ValidateJson(string jsonString);

        /// <summary>
        /// Method to Deserialize Json string into JsonUser classes
        /// </summary>
        List<JsonUser> ImportJson(string json);
    }
}

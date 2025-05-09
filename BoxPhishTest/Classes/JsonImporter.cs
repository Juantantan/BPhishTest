using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Schema;

namespace BoxPhishTest.Classes
{
    /// <summary>
    /// This class imports a Json file and validates it against the supplied Json schema: 'csv.output.json'.
    /// </summary>
    internal class JsonImporter
    {
        string jsonSchemaPath = Path.Combine(Environment.CurrentDirectory, "Schemas", "csv.output.json");
        string jsonFilePath = Path.Combine(Environment.CurrentDirectory, "RawDataFiles", "users.json");

        /// <summary>
        /// Method to get Users from Json file. 
        ///     Creates serializable Json string, then runs method calls for validation and conversion to List of JsonUser class objects
        /// </summary>
        public List<JsonUser> GetUsersFromJson()
        {
            string jsonString = "";

            jsonString = "[";
            foreach (string line in File.ReadLines(jsonFilePath))
            {
                jsonString = jsonString + line + ",";
            }
            jsonString = jsonString + "]";

            if (ValidateJson(jsonString) == false)
            {
                return new List<JsonUser>();
            }
            return ImportJson(jsonString);

        }
        /// <summary>
        /// Method to Deserialize Json string into JsonUser classes
        /// </summary>
        private static List<JsonUser> ImportJson(string json)
        {
            List<JsonUser> ?userList = JsonConvert.DeserializeObject<List<JsonUser>>(json);
            if (userList == null)
            {
                Console.WriteLine("Error deserializing JSON to List<JsonUser>.");
                return new List<JsonUser>();
            }
            return userList;
        }

        private bool ValidateJson(string jsonString)
        {
            /// <summary>
            /// Validates a supplied json string against given json schema: 'csv.output.json'
            /// </summary>
            string schemaData = File.ReadAllText(jsonSchemaPath);
            string errorString = "";
            JsonSchema schema = JsonSchema.Parse(schemaData);

            JArray jsonArray = JArray.Parse(jsonString);

            if (!jsonArray.IsValid(schema, out IList<string> errors))
            {
                Console.WriteLine("JSON is invalid. Errors:");
                foreach (var error in errors)
                {
                    Console.WriteLine($"- {error}\n");
                }
                return false;
            }
            return true;
        }
    }
}

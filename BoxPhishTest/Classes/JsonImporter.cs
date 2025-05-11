using BPhishTest.Interfaces;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Schema;

namespace BoxPhishTest.Classes
{
    internal class JsonImporter: IJsonImporter
    {
        string jsonSchemaPath = Path.Combine(Environment.CurrentDirectory, "Schemas", "csv.output.json");
        string jsonFilePath = Path.Combine(Environment.CurrentDirectory, "RawDataFiles", "users.json");

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
        public List<JsonUser> ImportJson(string json)
        {
            List<JsonUser> ?userList = JsonConvert.DeserializeObject<List<JsonUser>>(json);
            if (userList == null)
            {
                Console.WriteLine("Error deserializing JSON to List<JsonUser>.");
                return new List<JsonUser>();
            }
            return userList;
        }

        public bool ValidateJson(string jsonString)
        {
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

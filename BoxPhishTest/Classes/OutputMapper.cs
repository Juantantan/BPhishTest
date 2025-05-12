
using BoxPhishTest.Classes;
using Newtonsoft.Json;

using BPhishTest.Interfaces;
namespace BPhishTest.Classes
{
    internal class OutputMapper: IOutputMapper
    {
        static readonly string OutputPath = Path.Combine(Environment.CurrentDirectory, "Output", "users.csv");

        public bool GenerateOutputFromUser(List<CsvUser> csvUsers)
        {
            try
            {
                JsonSerializer serializer = new JsonSerializer();
                serializer.NullValueHandling = NullValueHandling.Include;

                using (StreamWriter sw = new StreamWriter(OutputPath))
                using (JsonWriter writer = new JsonTextWriter(sw))
                {
                    serializer.Serialize(writer, csvUsers);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error generating output from CsvUser List: {ex.Message}");
                return false;

            }

            Console.WriteLine($"output users.csv successfully created from CsvUser List in Output Folder");
            return true;
        }
        public bool GenerateOutputFromUser(List<JsonUser> jsonUsers)
        {
            try
            {
                JsonSerializer serializer = new JsonSerializer();
                serializer.NullValueHandling = NullValueHandling.Include;

                using (StreamWriter sw = new StreamWriter(OutputPath))
                using (JsonWriter writer = new JsonTextWriter(sw))
                {
                    serializer.Serialize(writer, jsonUsers);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error generating output from JsonUser List: {ex.Message}");
                return false;

            }
            Console.WriteLine($"output users.csv successfully created from JsonUser List in Output Folder");
            return true;

        }
        //public bool GenerateOutputFromUser(List<MySqlUser> mySqlUsers)
        //{
        //    try
        //    {
        //        JsonSerializer serializer = new JsonSerializer();
        //        serializer.NullValueHandling = NullValueHandling.Include;

        //        using (StreamWriter sw = new StreamWriter(OutputPath))
        //        using (JsonWriter writer = new JsonTextWriter(sw))
        //        {
        //            serializer.Serialize(writer, mySqlUsers);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine($"Error generating output from MySqlUser List: {ex.Message}");
        //        return false;

        //    }
        //    finally
        //    {
        //    }

        //    return true;

        //}
    }
}

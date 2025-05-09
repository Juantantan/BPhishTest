
namespace BoxPhishTest.Classes
{
    /// <summary>
    /// Class to hold user data from JSON file
    /// </summary>
    public class JsonUser
    {
        public string uuid { get; set; }
        public string full_name { get; set; }
        public string password { get; set; }
        public string email { get; set; }
        public string gender { get; set; }
        public int date_of_birth { get; set; }
    }
    public class Dob
    {
        public string type { get; set; }
        public string format { get; set; }
    }

    public class Email
    {
        public string type { get; set; }
        public string format { get; set; }
    }
    public class Ip
    {
        public string email { get; set; }
        public string format = "ipv4";
    }
}

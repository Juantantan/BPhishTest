using CsvHelper.Configuration;

namespace BoxPhishTest.Classes
{
    public class CsvUser
    {
        public int user_id { get; set; }
        public string user_name { get; set; }
        public DateTime date_registered { get; set; }
        public DateTime last_login { get; set; }
        public string family_name { get; set; }
        public string first_name { get; set; }
        public string password { get; set; }
        public string password_hash { get; set; }
        public string email_address { get; set; }
        public string gender { get; set; }
        public DateTime birthdate { get; set; }
        public string location { get; set; }
        public int show_online { get; set; }
        public string member_ip { get; set; }
        public string secret_question { get; set; }
        public string secret_answer { get; set; }
    }

    /// <summary>  
    /// Class to map user data to output fields (schema matches where possible) from Csv file  
    /// NB: The Mappings for first_name and family_name use the real_name in the raw csv and splits that into first and family name
    ///     There appears to be a better way to do this using the CsvHelper library, but this is a quick solution
    /// </summary>  
    public class CsvUserClassMap : ClassMap<CsvUser>
    {
        public CsvUserClassMap()
        {
            Map(m => m.user_id).Name("user_id");
            Map(m => m.user_name).Name("user_name");
            Map(m => m.date_registered).Name("date_registered");
            Map(m => m.last_login).Name("last_login");

            Map(m => m.first_name).Convert(args =>
            {
                var realName = args.Row.GetField<string>("real_name");
                return realName.Split(" ")[0];
            });

            Map(m => m.family_name).Convert(args =>
            {
                var realName = args.Row.GetField<string>("real_name");
                return realName.Split(" ").Length > 1 ? realName.Split(" ")[1] : string.Empty;
            });

            Map(m => m.password).Name("password");
            Map(m => m.password_hash).Name("password_hash");
            Map(m => m.email_address).Name("email_address");
            Map(m => m.gender).Name("gender");
            Map(m => m.birthdate).Name("birthdate");
            Map(m => m.location).Name("location");
            Map(m => m.show_online).Name("show_online");
            Map(m => m.member_ip).Name("member_ip");
            Map(m => m.secret_question).Name("secret_question");
            Map(m => m.secret_answer).Name("secret_answer");
        }
    }
}

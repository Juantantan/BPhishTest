using BPhishTest.Interfaces;
using MySql.Data.MySqlClient;

namespace BoxPhishTest.Classes
{
    /// <summary>
    /// This class imports a MySql database and table creation script, and then reads the user login history to check for failed logins.
    /// </summary>
    internal class MySqlImporter: IMySqlImporter
    {
        // Path to the SQL file and the SQL query to check for failed logins
        string sqlFilePath = Path.Combine(Environment.CurrentDirectory, "RawDataFiles", "users.sql");
        string sqlFilePathWin = Path.Combine(Environment.CurrentDirectory, "RawDataFiles", "users_win.sql");
        const string failedLoginResultsSqlQuery = "SELECT user_id, failure_reason FROM bfish.user_login_history WHERE login_status = 'failed';";

        /// <summary>
        /// adynchronous boolean method to generate tables in bfish and then query user login attempts, 
        /// </summary>
        public async Task<bool> ExecuteSql()
        {
            bool isSuccess = false;
            bool LinuxToWinSuccess = ConvertLinuxFormatSqlToWindows();
            if (LinuxToWinSuccess == false)
            {
                Console.WriteLine("Error converting SQL file from Linux to Windows format.");
                return false;
            }

            // Build connection string
            var builder = new MySqlConnectionStringBuilder
            {
                Server = "localhost",
                UserID = "root",
                Password = "KeyVault.BPhishUserPassword",
                Database = "bfish",
            };

            // Open a connection asynchronously from builder and return fail if fails
            using var connection = new MySqlConnection(builder.ConnectionString);
            try
            {
                await connection.OpenAsync();
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error connecting to MySQL server: {0}", ex.Message);
                return false;
            }

            // Run the script to create and populate the database
            try
            {
                // create a DB command and set the SQL statement with parameters
                using var cmdRunDBCreationAndPopulation = connection.CreateCommand();
                string commandText = File.ReadAllText(sqlFilePathWin);
                cmdRunDBCreationAndPopulation.CommandText = commandText;

                // execute the command and read the results
                var reader = await cmdRunDBCreationAndPopulation.ExecuteReaderAsync();
                if (reader == null)
                {
                    Console.WriteLine("Error executing MySql command.");
                    return false;
                }
                int userLoginsInserted = reader.RecordsAffected;
                if (userLoginsInserted == 0)
                {
                    Console.WriteLine("No user logins were inserted.");
                }
                else
                {
                    Console.WriteLine("User Logins added: {0}\n", userLoginsInserted);
                }
                reader.Close();
            }
            catch (MySqlException ex)
            {
                connection.Close();
                Console.WriteLine("Error connecting to MySQL server: {0}", ex.Message);
                return false;
            }

            // Query the user login history for failed logins
            using var cmdQueryFailedLogins = connection.CreateCommand();
            string cmdText = failedLoginResultsSqlQuery;
            cmdQueryFailedLogins.CommandText = cmdText;
            try
            {
                var reader2 = await cmdQueryFailedLogins.ExecuteReaderAsync();

                if (reader2.HasRows)
                {
                    Console.WriteLine($"Failed user Logins:");
                    while (reader2.Read())
                    {
                        Console.WriteLine($"\tuser_id: {reader2.GetInt32(0)}\tfailure_reason: {reader2.GetString(1)}");
                    }
                }
                else
                {
                    Console.WriteLine("All User Logins successfull.");
                }
                reader2.Close();
            }
            catch (MySqlException ex)
            {
                await connection.CloseAsync();
                Console.WriteLine("Error executing SQL command: {0}", ex.Message);
                return false;
            }

            return isSuccess = true; ;
        }
        /// <summary>
        /// Method to convert the SQL file from Linux to Windows format.
        /// </summary>
        public bool ConvertLinuxFormatSqlToWindows()
        {
            // Delete formatted file if it exists
            if (File.Exists(sqlFilePathWin))
            {
                File.Delete(sqlFilePathWin);
            }

            // Replace unwanted apostrophes and convert new line characters to Windows format
            string[] lines = File.ReadAllLines(sqlFilePath);
            for (int i = 0; i < lines.Length; i++)
            {
                lines[i] = lines[i].Replace("`", "");
                lines[i] = lines[i].Replace("\n", "\r\n");
            }
            File.WriteAllLines(sqlFilePathWin, lines);
            return true;
        }

    }
}

namespace BPhishTest.Interfaces
{
    /// <summary>
    /// Interface for MySqlImporter class
    /// </summary>
    internal interface IMySqlImporter
    {
        /// <summary>
        /// (Asynchronous) boolean method to generate tables in bfish database and then query user login attempts, 
        /// </summary>
        Task<bool> ExecuteSql();

        /// <summary>
        /// Method to convert the SQL file from Linux to Windows format.
        /// </summary>
        bool ConvertLinuxFormatSqlToWindows(string path);
    }
}

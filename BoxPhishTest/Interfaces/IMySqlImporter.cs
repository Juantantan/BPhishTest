namespace BPhishTest.Interfaces
{
    /// <summary>
    /// Interface for MySqlImporter class   
    /// </summary>
    internal interface IMySqlImporter
    {
        Task<bool> ExecuteSql();
        bool ConvertLinuxFormatSqlToWindows();
    }
}

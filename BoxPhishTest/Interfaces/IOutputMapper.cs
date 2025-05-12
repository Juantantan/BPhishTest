
using BoxPhishTest.Classes;

namespace BPhishTest.Interfaces
{
    /// <summary>
    /// Interface for OutputMapper class
    /// </summary>
    internal interface IOutputMapper
    {
        /// <summary>
        ///     Overloaded method to generate output from CsvUser List
        /// </summary>
        public bool GenerateOutputFromUser(List<CsvUser> csvUsers);
        /// <summary>
        ///     Overloaded method to generate output from CsvUser List
        /// </summary>
        public bool GenerateOutputFromUser(List<JsonUser> jsonUsers);

        /// <summary>
        ///     Overloaded method to generate output from MySqlUser List
        /// </summary>
        //public bool GenerateOutputFromUser(List<MySqlUser> mySqlUsers)
    }
}

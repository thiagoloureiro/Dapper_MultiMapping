namespace DapperMultiMapping.Model
{
    public class BankAccount
    {
        public Bank Bank { get; set; }
        public User User { get; set; }
        public Currency Currency { get; set; }
        public AccountType AccountType { get; set; }
        public AccountCategory AccountCategory { get; set; }
        public Manager Manager { get; set; }
        public string Branch { get; set; }
        public string Account { get; set; }
    }
}
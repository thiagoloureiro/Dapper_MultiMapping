using Dapper;
using DapperMultiMapping.Model;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace DapperMultiMapping.Data
{
    public static class BankRepo
    {
        private static string connstring = "Data Source=localhost;Initial Catalog=DapperMultiMapping;Integrated Security=SSPI;";

        public static List<BankAccount> GetList()
        {
            string sqlQuery = @"SELECT
            BA.Id, BA.Account, BA.Branch,
            U.Id, U.Name,
            A.Id, A.Street, A.City,
            C.Id, C.Name,
            BK.Id, BK.Name,
            ACT.Id, ACT.Name,
            ACC.Id, ACC.Name,
            M.Id, M.Name
            from BankAccount BA
            inner join [User] U on U.Id = BA.UserId
            inner join [Address] A on A.Id = U.AddressId
            inner join Currency C on C.Id = BA.CurrencyId
            inner join Bank BK on BK.Id = BA.BankId
            inner join AccountType ACT on ACT.Id = BA.AccountTypeId
            inner join AccountCategory ACC on ACC.Id = BA.AccountCategory
            inner join Manager M on M.Id = BA.ManagerId";

            List<BankAccount> ret;
            using (var db = new SqlConnection(connstring))
            {
                ret = db.Query<BankAccount>(sqlQuery,
                    new[]
                    {
                        typeof(BankAccount),
                        typeof(User),
                        typeof(Address),
                        typeof(Currency),
                        typeof(Bank),
                        typeof(AccountType),
                        typeof(AccountCategory),
                        typeof(Manager)
                    },
                    objects =>
                    {
                        var bankaccount = objects[0] as BankAccount;
                        var user = objects[1] as User;
                        var address = objects[2] as Address;
                        var currency = objects[3] as Currency;
                        var bank = objects[4] as Bank;
                        var accounttype = objects[5] as AccountType;
                        var accountcategory = objects[6] as AccountCategory;
                        var manager = objects[7] as Manager;

                        bankaccount.User = user;
                        bankaccount.User.Address = address;
                        bankaccount.Bank = bank;
                        bankaccount.Currency = currency;
                        bankaccount.AccountType = accounttype;
                        bankaccount.AccountCategory = accountcategory;
                        bankaccount.Manager = manager;

                        return bankaccount;
                    }, splitOn: "Id, Id, Id, Id, Id, Id, Id, Id").AsList();
            }

            return ret;
        }
    }
}
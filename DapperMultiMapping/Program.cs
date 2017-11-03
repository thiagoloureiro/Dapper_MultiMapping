using System;
using DapperMultiMapping.Data;

namespace DapperMultiMapping
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            var list = BankRepo.GetList();

            foreach (var item in list)
            {
                Console.WriteLine("Informações da conta");
                Console.WriteLine("-    -    -");
                Console.WriteLine($"Nome: {item.User.Name}");
                Console.WriteLine($"Rua: {item.User.Address.Street}");
                Console.WriteLine($"Cidade: {item.User.Address.City}");
                Console.WriteLine("-    -    -");
                Console.WriteLine($"Banco: {item.Bank.Name}");
                Console.WriteLine($"Agência: {item.Branch}");
                Console.WriteLine($"Conta: {item.Account}");
                Console.WriteLine($"Categoria de Conta: {item.AccountCategory.Name}");
                Console.WriteLine($"Tipo de Conta: {item.AccountType.Name}");
                Console.WriteLine($"Moeda: {item.Currency.Name}");
                Console.WriteLine($"Gerente: {item.Manager.Name}");
                Console.WriteLine("");
            }
            Console.ReadLine();
        }
    }
}
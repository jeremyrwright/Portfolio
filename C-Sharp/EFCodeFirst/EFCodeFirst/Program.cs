using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCodeFirst
{
    class Program
    {
        static void Main(string[] args)
        {
            using(var Db = new StudentDb())
            {
                Console.WriteLine("Enter Student Name:");
                var name = Console.ReadLine();
                var st = true;

                var record = new Student() { Name = name, Status = st };

                Console.WriteLine("Creating and accessing the Database. Please wait...");
                Db.Students.Add(record);
                Db.SaveChanges();

                var query = from d in Db.Students
                            select d;

                Console.WriteLine("Id\tName\t\t\tStatus");
                Console.WriteLine("--------------------------------------------------");

                foreach(var data in query)
                {
                    Console.WriteLine("{0}\t{1}\t\t\t{2}", data.Id, data.Name, data.Status);
                }
                Console.WriteLine("--------------------------------------------------");
                Console.WriteLine("Press any key to exit.");
                Console.ReadKey();
            }
        }
    }

    public class Student
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
    }
}

namespace EFCodeFirst
{
    using System;
    using System.Data.Entity;
    using System.Linq;

    public class StudentDb : DbContext
    {
        public DbSet<Student> Students { get; set; }
    }
}
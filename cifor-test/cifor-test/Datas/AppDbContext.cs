using cifor_test.Models;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace cifor_test.Datas
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        public DbSet<Employee> Employees { get; set; }
    }
}

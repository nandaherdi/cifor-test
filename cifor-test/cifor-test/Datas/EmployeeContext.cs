using cifor_test.Models;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace cifor_test.Datas
{
    public class EmployeeContext : DbContext
    {
        public EmployeeContext(DbContextOptions<EmployeeContext> options) : base(options) { }

        public DbSet<Employee> Employees { get; set; }
    }
}

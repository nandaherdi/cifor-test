using cifor_test.Datas;
using cifor_test.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace cifor_test.Controllers
{
    
    [ApiController]
    [Route("api")]

    public class EmployeesController : ControllerBase
    {
        private readonly AppDbContext _context;

        public EmployeesController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet("Get")]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _context.Employees.ToListAsync());
        }

        [HttpGet("Get/{id}")]
        public async Task<IActionResult> GetById(string id)
        {
            var emp = await _context.Employees.FindAsync(id);
            if (emp == null) return NotFound($"Employee with ID {id} not found.");
            return Ok(emp);
        }

        [HttpGet("Get/employees/search")]
        public async Task<IActionResult> Search(string name, string department)
        {
            var result = await _context.Employees
                .Where(e => (name == null || e.Name.Contains(name)) &&
                            (department == null || e.Department == department))
                .ToListAsync();
            return Ok(result);
        }

        [HttpPost("employees")]
        public async Task<IActionResult> Create(Employee employee)
        {
            if (employee == null || string.IsNullOrEmpty(employee.EmployeeId))
                return BadRequest("Invalid employee data.");

            int employeeCount = await _context.Employees.CountAsync();
            employee.EmployeeId = "G" + (employeeCount + 1);

            await _context.Employees.AddAsync(employee);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetById), new { id = employee.EmployeeId }, employee);
        }

        [HttpDelete("employees/{id}")]
        public async Task<IActionResult> Delete(string id)
        {
            var emp = await _context.Employees.FindAsync(id);
            if (emp == null) return NotFound();

            _context.Employees.Remove(emp);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpPut("employees/{id}")]
        public async Task<IActionResult> Update(string id, Employee employee)
        {
            var existingEmployee = await _context.Employees.FindAsync(id);
            if (existingEmployee == null)
                return NotFound($"Employee with ID {id} not found.");

            existingEmployee.Name = employee.Name ?? existingEmployee.Name;
            existingEmployee.Address = employee.Address ?? existingEmployee.Address;
            existingEmployee.Department = employee.Department ?? existingEmployee.Department;
            existingEmployee.Email = employee.Email ?? existingEmployee.Email;

            _context.Employees.Update(existingEmployee);
            await _context.SaveChangesAsync();

            return Ok(existingEmployee);
        }
    }
}

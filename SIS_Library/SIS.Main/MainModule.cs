using SIS;
using SIS.Exception;
using SIS.Main;
using SIS_Library.SIS.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SIS.Main
{
    public class Program
    {
        private static Teacher teacher1;

        public static Teacher GetTeacher1()
        {
            return teacher1;
        }

        public static void Main(string[] args, Course course1, Teacher teacher1)
        {
            Console.WriteLine("\nStudent Information System Initiated");
            try
            {
                SIS sis = new SIS();

                // Create instances of Student, Course, and Teacher
                Student student1 = new Student(1, "John", "Doe", new DateTime(2000, 1, 1), "john.doe@example.com", "1234567890");
                Teacher teacherAlice = new Teacher(201, "Alice", "Johnson", "alice.johnson@example.com");

                // Add students, courses, and teachers to SIS
                sis.Students.Add(student1);
                sis.Courses.Add(new Course(101, "Mathematics", "MATH101", "Dr. Smith"));
                sis.Teachers.Add(teacherAlice);

                // Enroll student in a course
                sis.AddEnrollment(student1, new Course(101, "Mathematics", "MATH101", "Dr. Smith"), DateTime.Now);
                Console.WriteLine($"Student {student1.FirstName} enrolled in {new Course(101, "Mathematics", "MATH101", "Dr. Smith").CourseName}.");

                // Attempt to enroll the same student in the same course again
                try

                {
                    sis.AddEnrollment(student1, new Course(101, "Mathematics", "MATH101", "Dr. Smith"), DateTime.Now);
                }
                catch (DuplicateEnrollmentException ex)
                {
                    Console.WriteLine($"Error: {ex.Message}");
                }

                // Assign teacher to the course
                sis.AssignCourseToTeacher(new Course(101, "Mathematics", "MATH101", "Dr. Smith"), teacherAlice);
                Console.WriteLine($"Teacher {teacherAlice.FirstName} assigned to {new Course(101, "Mathematics", "MATH101", "Dr. Smith").CourseName}.");

                // Make a payment
                sis.AddPayment(student1, 500, DateTime.Now);
                Console.WriteLine($"Payment of $500 recorded for {student1.FirstName}.");

                // Retrieve enrollments for a student
                var enrollments = sis.GetEnrollmentsForStudent(student1);
                Console.WriteLine($"Enrollments for {student1.FirstName}:");
                foreach (var enrollment in enrollments)
                {
                    Console.WriteLine($"- {enrollment.Course.CourseName} on {enrollment.EnrollmentDate.ToShortDateString()}");
                }

                // Retrieve courses for a teacher
                var coursesForTeacher = sis.GetCoursesForTeacher(teacherAlice);
                Console.WriteLine($"Courses assigned to {teacherAlice.FirstName}:");
                foreach (var course in coursesForTeacher)
                {
                    Console.WriteLine($"- {course.CourseName}");
                }
                Console.WriteLine("\n All operations were completed successfully.");
            }
            catch (ApplicationException ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
            }
        }
    }
}

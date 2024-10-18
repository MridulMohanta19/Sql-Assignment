﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SIS_Library.SIS.Entity
{
        public class Enrollment
        {
        private int v;

        public int EnrollmentId { get; set; }
            public int StudentId { get; set; }
            public int CourseId { get; set; }
            public DateTime EnrollmentDate { get; set; }
            public Student Student { get; set; }
            public Course Course { get; set; }

            public Enrollment(int enrollmentId, int studentId, int courseId, DateTime enrollmentDate, Student student, Course course)
            {
                EnrollmentId = enrollmentId;
                StudentId = studentId;
                CourseId = courseId;
                EnrollmentDate = enrollmentDate;
                Student = student;
                Course = course;
            }

       public Enrollment() { }

        public Enrollment(int v, Student student, Course course, DateTime enrollmentDate)
        {
            this.v = v;
            Student = student;
            Course = course;
            EnrollmentDate = enrollmentDate;
        }

        public Student GetStudent()
            {
                return Student;
            }

            public Course GetCourse()
            {
                return Course;
            }
        }
    }

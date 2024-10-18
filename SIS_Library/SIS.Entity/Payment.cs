using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SIS_Library.SIS.Entity
{
        public class Payment
        {
        private object value;

        public int PaymentId { get; set; }
            public int StudentId { get; set; }
            public decimal Amount { get; set; }
            public DateTime PaymentDate { get; set; }
            public Student Student { get; set; }

            public Payment(int paymentId, int studentId, decimal amount, DateTime paymentDate, Student student)
            {
                PaymentId = paymentId;
                StudentId = studentId;
                Amount = amount;
                PaymentDate = paymentDate;
                Student = student;
            }
        public Payment() { }

        public Payment(object value, Student student, decimal amount, DateTime paymentDate)
        {
            this.value = value;
            Student = student;
            Amount = amount;
            PaymentDate = paymentDate;
        }

        public Student GetStudent()
            {
                return Student;
            }

            public decimal GetPaymentAmount()
            {
                return Amount;
            }

            public DateTime GetPaymentDate()
            {
                return PaymentDate;
            }
        }
    }


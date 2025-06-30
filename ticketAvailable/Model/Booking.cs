using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ticketAvailable.Model
{
    internal class Booking
    {
        public Events EventRefernce { get; set; }
        public int NumTickets { get; set; }
        public decimal TotalCost { get; set; }

        public Booking(Events ev)
        {
            EventRefernce = ev;
        }

        public void CalculateBookingCOst(int numTickets)
        {
            NumTickets = numTickets;
            TotalCost = numTickets * EventRefernce.TicketPrice;
        }

        public void BookTickets(int numTickets)
        {
            EventRefernce.BookTickets(numTickets);
            CalculateBookingCOst(numTickets);
        }

        public void CancelBooking(int numTickets)
        {
            EventRefernce.CancelBooking(numTickets);
            NumTickets -= numTickets;
            TotalCost -= numTickets*EventRefernce.TicketPrice;
        }

        public int GetAvailableNoOfTickets() => EventRefernce.AvailableSeats;
        public void GetEventDetails() => EventRefernce.DisplayEventDetails();
    }
}

namespace ticketAvailable.Model.Abstract
{
    public abstract class Event
    {
        public string EventName { get; set; }
        public DateTime EventDate { get; set; }
        public TimeSpan EventTime { get; set; }
        public string VenueName { get; set; }
        public int TotalSeats { get; set; }
        public int AvailableSeats { get; set; }
        public decimal TicketPrice { get; set; }

        public Event(string name, DateTime date, TimeSpan time, string venue, int seats, decimal price)
        {
            EventName = name;
            EventDate = date;
            EventTime = time;
            VenueName = venue;
            TotalSeats = seats;
            AvailableSeats = seats;
            TicketPrice = price;
        }

        public void BookTickets(int count) => AvailableSeats -= count;
        public void CancelTickets(int count) => AvailableSeats += count;
        public int GetAvailableSeats() => AvailableSeats;
        public decimal CalculateRevenue() => (TotalSeats - AvailableSeats) * TicketPrice;

        public abstract void DisplayEventDetails();
    }
}

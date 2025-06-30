namespace ticketAvailable.Model.Abstract
{
    public abstract class BookingSystem
    {
        public abstract Event CreateEvent(string type, string name, DateTime date, TimeSpan time, string venue, int seats, decimal price);
        public abstract void BookTickets(Event ev, int count);
        public abstract void CancelTickets(Event ev, int count);
        public abstract void DisplayEvent(Event ev);
        public abstract int GetAvailableSeats(Event ev);
    }
}

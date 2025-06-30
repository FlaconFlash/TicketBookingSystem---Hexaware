using ticketAvailable.Model.Abstract;
using ticketAvailable.Model.DerivedEvents;

namespace ticketAvailable.Service
{
    public class TicketBookingSystem : BookingSystem
    {
        private List<Event> events = new();

        public override Event CreateEvent(string type, string name, DateTime date, TimeSpan time, string venue, int seats, decimal price)
        {
            Event e = type.ToLower() switch
            {
                "movie" => new Movie(name, date, time, venue, seats, price, "Thriller", "Actor X", "Actress Y"),
                "concert" => new Concert(name, date, time, venue, seats, price, "Imagine Dragons", "Rock"),
                "sport" => new Sport(name, date, time, venue, seats, price, "Cricket", "India vs Australia"),
                _ => null
            };

            if (e != null) events.Add(e);
            return e;
        }

        public override void BookTickets(Event ev, int count) => ev.BookTickets(count);
        public override void CancelTickets(Event ev, int count) => ev.CancelTickets(count);
        public override void DisplayEvent(Event ev) => ev.DisplayEventDetails();
        public override int GetAvailableSeats(Event ev) => ev.AvailableSeats;
    }
}

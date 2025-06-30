using ticketAvailable.Model.Abstract;

namespace ticketAvailable.Model.DerivedEvents
{
    public class Sport : Event
    {
        public string SportName { get; set; }
        public string Teams { get; set; }

        public Sport(string name, DateTime date, TimeSpan time, string venue, int seats, decimal price, string sportName, string teams)
            : base(name, date, time, venue, seats, price)
        {
            SportName = sportName;
            Teams = teams;
        }

        public override void DisplayEventDetails()
        {
            Console.WriteLine($"🏟 Sport: {EventName}, Match: {Teams}, Sport: {SportName}, ₹{TicketPrice}, Seats: {AvailableSeats}/{TotalSeats}");
        }
    }
}

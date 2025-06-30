using ticketAvailable.Model.Abstract;

namespace ticketAvailable.Model.DerivedEvents
{
    public class Concert : Event
    {
        public string Artist { get; set; }
        public string ConcertType { get; set; }

        public Concert(string name, DateTime date, TimeSpan time, string venue, int seats, decimal price, string artist, string type)
            : base(name, date, time, venue, seats, price)
        {
            Artist = artist;
            ConcertType = type;
        }

        public override void DisplayEventDetails()
        {
            Console.WriteLine($"🎤 Concert: {EventName}, Artist: {Artist}, Type: {ConcertType}, ₹{TicketPrice}, Seats: {AvailableSeats}/{TotalSeats}");
        }
    }
}

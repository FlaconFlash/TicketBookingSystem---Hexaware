using ticketAvailable.Model.Abstract;

namespace ticketAvailable.Model.DerivedEvents
{
    public class Movie : Event
    {
        public string Genre { get; set; }
        public string Actor { get; set; }
        public string Actress { get; set; }

        public Movie(string name, DateTime date, TimeSpan time, string venue, int seats, decimal price, string genre, string actor, string actress)
            : base(name, date, time, venue, seats, price)
        {
            Genre = genre;
            Actor = actor;
            Actress = actress;
        }

        public override void DisplayEventDetails()
        {
            Console.WriteLine($"🎬 Movie: {EventName}, Genre: {Genre}, Cast: {Actor} & {Actress}, ₹{TicketPrice}, Seats: {AvailableSeats}/{TotalSeats}");
        }
    }
}

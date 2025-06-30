using ticketAvailable.Model.Abstract;
using ticketAvailable.Service;

class Program
{
    static void Main()
    {
        var system = new TicketBookingSystem();
        Event currentEvent = null;
        string input;

        Console.WriteLine("🎟 Ticket Booking System");

        do
        {
            Console.WriteLine("\nCommands: create_event | book_tickets | cancel_tickets | get_available_seats | display_event | exit");
            Console.Write("Command: ");
            input = Console.ReadLine()?.Trim().ToLower();

            switch (input)
            {
                case "create_event":
                    Console.Write("Type (movie/concert/sport): ");
                    string type = Console.ReadLine();
                    Console.Write("Name: ");
                    string name = Console.ReadLine();
                    Console.Write("Date (yyyy-mm-dd): ");
                    DateTime date = DateTime.Parse(Console.ReadLine());
                    Console.Write("Time (hh:mm): ");
                    TimeSpan time = TimeSpan.Parse(Console.ReadLine());
                    Console.Write("Venue: ");
                    string venue = Console.ReadLine();
                    Console.Write("Seats: ");
                    int seats = int.Parse(Console.ReadLine());
                    Console.Write("Price: ");
                    decimal price = decimal.Parse(Console.ReadLine());

                    currentEvent = system.CreateEvent(type, name, date, time, venue, seats, price);
                    Console.WriteLine("✅ Event created.");
                    break;

                case "book_tickets":
                    if (currentEvent == null) { Console.WriteLine("⚠ No event."); break; }
                    Console.Write("Tickets to book: ");
                    int bookCount = int.Parse(Console.ReadLine());
                    system.BookTickets(currentEvent, bookCount);
                    break;

                case "cancel_tickets":
                    if (currentEvent == null) { Console.WriteLine("⚠ No event."); break; }
                    Console.Write("Tickets to cancel: ");
                    int cancelCount = int.Parse(Console.ReadLine());
                    system.CancelTickets(currentEvent, cancelCount);
                    break;

                case "get_available_seats":
                    if (currentEvent == null) { Console.WriteLine("⚠ No event."); break; }
                    Console.WriteLine($"🎫 Seats available: {system.GetAvailableSeats(currentEvent)}");
                    break;

                case "display_event":
                    if (currentEvent == null) { Console.WriteLine("⚠ No event."); break; }
                    system.DisplayEvent(currentEvent);
                    break;

                case "exit":
                    Console.WriteLine("👋 Exiting system.");
                    break;

                default:
                    Console.WriteLine("❓ Invalid command.");
                    break;
            }
        }
        while (input != "exit");
    }
}

namespace Conduit.Domain
{
    public class FollowedPeople
    {
        public int ObserverId { get; set; }

        public int TargetId { get; set; }


        public User Target { get; set; }

        public User Observer { get; set; }
    }
}
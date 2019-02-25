namespace PSBooked
{
    /// <summary>
    /// What kind of Reccurence Rule is out there
    /// </summary>
    public class RecurrenceRuleType
    {
        private RecurrenceRuleType(string value) { Value = value; }

        public string Value { get; set; }

        public static RecurrenceRuleType Daily { get { return new RecurrenceRuleType("daily"); } }
        public static RecurrenceRuleType Monthly { get { return new RecurrenceRuleType("monthly"); } }
        public static RecurrenceRuleType None { get { return new RecurrenceRuleType("none"); } }
        public static RecurrenceRuleType Weekly { get { return new RecurrenceRuleType("weekly"); } }
        public static RecurrenceRuleType Yearly { get { return new RecurrenceRuleType("yearly"); } }
    }
}

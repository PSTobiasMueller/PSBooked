using System;
using System.Linq;

namespace PSBooked
{
    /// <summary>
    /// RecurrenceRule Class. Used to Create Recurrence Rules for Reservations
    /// </summary>
    public class RecurrenceRule
    {
        private String _type;
        private int _interval;
        private String _monthlyType;
        private int[] _weekdays;
        private DateTime _repeatTerminationDate;

        private string[] AllowedTypes = new string[] { "daily", "monthly", "none", "weekly", "yearly" };

        /// <summary>
        /// The Type of the Recurrence
        /// </summary>
        public String Type
        {
            get { return this._type; }
            set
            {
                if (!AllowedTypes.Any(x => x == value))
                    throw new ArgumentException("Not valid Type");
                _type = value;
            }
        }
        /// <summary>
        /// The Interval of the Recurrence
        /// </summary>
        public int Interval
        {
            get { return this._interval; }
            set { this._interval = value; }
        }
        /// <summary>
        /// The MonthlyType of the Recurrence
        /// </summary>
        public String MonthlyType
        {
            get { return this._monthlyType; }
            set { if (value != null) { this._monthlyType = value; } }
        }
        /// <summary>
        /// The Weekdays of the Recurrence
        /// </summary>
        public int[] Weekdays
        {
            get { return this._weekdays; }
            set { this._weekdays = value; }
        }
        /// <summary>
        /// The End of of the Recurrence
        /// </summary>
        public DateTime RepeatTerminationDate
        {
            get { return this._repeatTerminationDate; }
            set { if (value != null) { this._repeatTerminationDate = value; } }
        }
        /// <summary>
        /// Overrides toString Method to Output the Values of the Reminder
        /// instead of the Class Type
        /// </summary>
        public override string ToString()
        {
            return string.Format("Type: {0}, Interval: {1}, MonthlyType: {2}, Weekdays: {3}, RepeatTerminationDate: {4}", Type, Interval, MonthlyType, Weekdays, RepeatTerminationDate);
        }
    }
}
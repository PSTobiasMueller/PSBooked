using System;

namespace PSBooked
{
    /// <summary>
    /// Reminder Class. Used to Create Reminder for Reservations
    /// </summary>
    public class Reminder
    {
        private int _value;
        private String _interval;

        /// <summary>
        /// The Timer of the Reminder
        /// </summary>
        public int Value
        {
            get { return this._value; }
            set { this._value = value; }
        }
        /// <summary>
        /// The Interval of the Reminder
        /// </summary>
        public String Interval
        {
            get { return this._interval; }
            set { if (value != null) { this._interval = value; }  }
        }
        /// <summary>
        /// Overrides toString Method to Output the Values of the Reminder
        /// instead of the Class Type
        /// </summary>
        public override string ToString()
        {
            return string.Format("Value: {0}, Interval: {1}", Value, Interval);
        }
    }
}
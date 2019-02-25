using System;

namespace PSBooked
{
    /// <summary>
    /// Reservation Class. Used to Create new Reservation
    /// </summary>
    public class Reservation
    {
        private String _title = "";

        /// <summary>
        /// The Title of the Reservation
        /// </summary>
        public String Title
        {
            get
            {

                return this._title;

            }

            set
            {

                if (value != null) { this._title = value; }

            }

        }

    }
}
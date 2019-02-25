using System;
using System.Collections.Generic;

namespace PSBooked
{
    /// <summary>
    /// Reservation Class. Used to Create new Reservation
    /// </summary>
    public class Reservation
    {
        private String _title;
        private String _description;
        private DateTime _startDateTime;
        private DateTime _endDateTime;
        private int _userID = 0;
        private int[] _resourceID;
        private PSBooked.RecurrenceRule _recurrenceRule;
        private Boolean _allowParticipation;
        private Boolean _termsAccepted;
        /*
        private PSBooked.Accessory[] _accessories;
        private PSBooked.CustomAttributes[] _customAttributes;
        */
        private PSBooked.Reminder _startReminder;
        private PSBooked.Reminder _endReminder;
        public List<PSBooked.Reminder> li = new List<PSBooked.Reminder>();

        /// <summary>
        /// The Title of the Reservation
        /// </summary>
        public String Title
        {
            get { return this._title; }
            set { if (value != null) { this._title = value; }  }
        }
        /// <summary>
        /// The Description of the Reservation
        /// </summary>
        public String Description
        {
            get { return this._description; }
            set { if (value != null) { this._description = value; }  }
        }
        /// <summary>
        /// The Start Date and Time of the Reservation
        /// </summary>
        public DateTime StartDateTime
        {
            get { return this._startDateTime; }
            set { if (value != null) { this._startDateTime = value; }  }
        }
        /// <summary>
        /// The End Date and Time of the Reservation
        /// </summary>
        public DateTime EndDateTime
        {
            get { return this._endDateTime; }
            set { if (value != null) { this._endDateTime = value; }  }
        }
        /// <summary>
        /// The End Date and Time of the Reservation
        /// </summary>
        public int UserID
        {
            get { return this._userID; }
            set { this._userID = value; }
        }
        /// <summary>
        /// The RecurrenceRule of the Reservation. If Needed
        /// </summary>
        public PSBooked.RecurrenceRule RecurrenceRule
        {
            get { return this._recurrenceRule; }
            set { this._recurrenceRule = value; }
        }
        /// <summary>
        /// The Ressources to reserve
        /// </summary>
        public int[] ResourceID
        {
            get { return this._resourceID; }
            set { this._resourceID = value; }
        }
        /// <summary>
        /// The allow Participation of other Users or Guests
        /// </summary>
        public Boolean AllowParticipation
        {
            get { return this._allowParticipation; }
            set { this._allowParticipation = value;  }
        }
        /// <summary>
        /// Boolean Value if the Terms uf Use are accepted
        /// </summary>
        public Boolean TermsAccepted
        {
            get { return this._termsAccepted; }
            set { this._termsAccepted = value; }
        }
        /*
        /// <summary>
        /// Accessories who are reserved additionally to the resource
        /// </summary>
        public PSBooked.Accessory[] Accessories
        {
            get { return this._accessories; }
            set { if (value != null) { this._accessories = value; }  }
        }
        /// <summary>
        /// Custom Attributes for the Reservation
        /// </summary>
        public PSBooked.CustomAttributes[] CustomAttributes
        {
            get { return this._customAttributes; }
            set { if (value != null) { this._customAttributes = value; }  }
        } */
        /// <summary>
        /// Start Reminder for the Event
        /// </summary>
        public PSBooked.Reminder StartReminder
        {
            get { return this._startReminder; }
            set { if (value != null) { this._startReminder = value; }  }
        }
        /// <summary>
        /// End Reminder for the Event
        /// </summary>
        public PSBooked.Reminder EndReminder
        {
            get { return this._endReminder; }
            set { if (value != null) { this._endReminder = value; }  }
        }
    }
}
package booking

import (
	"fmt"
	"time"
)

const scheduleForm = "1/2/2006 15:04:05"

// Schedule returns a time.Time from a string containing a date
func Schedule(date string) time.Time {
	t, _ := time.Parse(scheduleForm, date)
	return t
}

const appointmentForm = "January 2, 2006 15:04:05"

// HasPassed returns whether a date has passed
func HasPassed(date string) bool {
	t, _ := time.Parse(appointmentForm, date)
	return time.Now().After(t)
}

const specificAppointmentForm = "Monday, January 2, 2006 15:04:05"

// IsAfternoonAppointment returns whether a time is in the afternoon
func IsAfternoonAppointment(date string) bool {
	t, _ := time.Parse(specificAppointmentForm, date)
	return t.Hour() >= 12 && t.Hour() < 18
}

// Description returns a formatted string of the appointment time
func Description(date string) string {
	t, _ := time.Parse(scheduleForm, date)
	return fmt.Sprintf(
		"You have an appointment on %s, %s %d, %d, at %d:%d.",
		t.Weekday(), t.Month(), t.Day(), t.Year(), t.Hour(), t.Minute(),
	)
}

const anniversaryDate = "9/15/2012"
const anniversaryForm = "1/2/2006"

// AnniversaryDate returns a Time with this year's anniversary
func AnniversaryDate() time.Time {
	t, _ := time.Parse(anniversaryForm, anniversaryDate)
	return t.AddDate(time.Now().Year()-2012, 0, 0)
}

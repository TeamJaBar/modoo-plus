"use strict";

$("#myEvent").fullCalendar({
	height: 650,
	header: {
		left: 'prev,next',
		center: ' title',
		right: 'today'
	},
	editable: false,
	events: calendar,
	timeFormat: 'hh:mm'
});

"use strict";

console.log('확인2');


$("#myEvent").fullCalendar({
	height: 650,
	header: {
		left: '',
		center: 'prev, title, next',
		right: 'today'
	},
	editable: false,
	events: calendar,
	eventTimeFormat: { // like '14:30:00'
		hour: '2-digit',
		minute: '2-digit',
		meridiem: false,
		hour12: false
	}
});

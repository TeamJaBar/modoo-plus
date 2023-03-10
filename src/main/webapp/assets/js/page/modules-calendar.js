"use strict";

console.log('확인2');


$("#myEvent").fullCalendar({
	height: 521,
	customButtons: {
		myCustomButton: {
			text: '전체',
			click: function() {
				alert('clicked the custom button!');
			}
		}
	},
	header: {
		left: '',
		center: 'prev, title, next',
		right: 'myCustomButton'
	},
	editable: false,
	events: calendar

});

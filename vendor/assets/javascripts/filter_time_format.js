/*
 * Javascript time conversion script
 * version 1.0
 * @requires jQuery
 * @author Modern Tribe, Inc. (Peter Chester)
 *
 * Converts several formats to a 2 point float. Accepted formats include:
 * 1.3333333333
 * 1h 10m
 * 1:10
 * 1
 *
 * Entries over 15 hours are assumed to be 15 minutes.
 */

function filterTimeFormat(time) {

	// Number of decimal places to round to
	var decimal_places = 2;

	// Maximum number of hours before we should assume minutes were intended. Set to 0 to remove the maximum.
	var maximum_hours = 15;

	// 3
	var int_format = time.match(/^\d+$/);

	// 1:15
	var time_format = time.match(/([\d]*):([\d]+)/);

	// 10m
	var minute_string_format = time.toLowerCase().match(/([\d]+)m/);

	// 2h
	var hour_string_format = time.toLowerCase().match(/([\d]+)h/);

	if (time_format != null) {
		hours = parseInt(time_format[1]);
		minutes = parseFloat(time_format[2]/60);
		time = hours + minutes;
	} else if (minute_string_format != null || hour_string_format != null) {
		if (hour_string_format != null) {
			hours = parseInt(hour_string_format[1]);
		} else {
			hours = 0;
		}
		if (minute_string_format != null) {
			minutes = parseFloat(minute_string_format[1]/60);
		} else {
			minutes = 0;
		}
		time = hours + minutes;
	} else if (int_format != null) {
		// Entries over 15 hours are likely intended to be minutes.
		time = parseInt(time);
		if (maximum_hours > 0 && time > maximum_hours) {
			time = (time/60).toFixed(decimal_places);
		}
	}

	// make sure what ever we return is a 2 digit float
	time = parseFloat(time).toFixed(decimal_places);

	return time;
}
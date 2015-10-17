var Teacher = {
	
}

$(document).on('ready page:load', function() {
	$('#delete_course').click(function() {
		$('#course_to_delete').val($('select#course').val());
		$('#course_delete').submit();
	});


	$('#edit_course').click(function() {
		$('#course_to_edit').val($('select#course').val());
		$('#course_edit').submit();
	});

	var $TABLE = $('#table');
	var $BTN = $("input[value='submit']");
	var $EXPORT = $('#course_assignment_data');

	$('.table-add').click(function () {
	  var $clone = $TABLE.find('tr.hide').clone(true).removeClass('hide table-line');
	  $TABLE.find('table').append($clone);
	});

	$('.table-remove').click(function () {
	  $(this).parents('tr').detach();
	});

	$('.table-up').click(function () {
	  var $row = $(this).parents('tr');
	  if ($row.index() === 1) return; // Don't go above the header
	  $row.prev().before($row.get(0));
	});

	$('.table-down').click(function () {
	  var $row = $(this).parents('tr');
	  $row.next().after($row.get(0));
	});

	// A few jQuery helpers for exporting only
	jQuery.fn.pop = [].pop;
	jQuery.fn.shift = [].shift;

	$BTN.click(function () {
	  var $rows = $TABLE.find('tr:not(:hidden)');
	  var headers = [];
	  var data = [];
	  
	  // Get the headers (add special header logic here)
	  $($rows.shift()).find('th:not(:empty)').each(function () {
	    headers.push($(this).text().toLowerCase());
	  });
	  
	  // Turn all existing rows into a loopable array
	  $rows.each(function () {
	    var $td = $(this).find('td');
	    var h = {};
	    h['assignment'] = $(this).find('td').eq(0).text();
	    h['due_date'] = $(this).find('td > input').val();
	    h['type'] = $(this).find('td > select > option:selected' ).text()
	    
	    data.push(h);
	  });
	  
	  // Output the result
	  $EXPORT.val(JSON.stringify(data));
	});
});
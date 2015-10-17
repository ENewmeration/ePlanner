$(document).on('change', 'select#student-select-course', function() {
	Turbolinks.visit(this.value);
});

$(document).on('change', 'select#select-assignmenttype', function() {
	$("#assignment_table > tbody > tr[id!='header']").each(function() {
		// If all selected or current row is of selected type then show
		if ($("#select-assignmenttype option:selected").text() == "All Assignments" || 
				$("#select-assignmenttype option:selected").text() ==$(this).find("td:eq(2)").text()) {
			$(this).show();
		}
		else {
			$(this).hide();
		}
	});
});
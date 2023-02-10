function selectAll(selectAll)  {
  const checkboxes = document.querySelectorAll('input[type="checkbox"]');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  });
}

function delete_check() {
		let deletearr = [];
		$("input:checkbox[name='chkAll']:checked").each(function() {
			  deletearr.push($(this).val());
		});
		$("#delete_num").val(deletearr);
		if (confirm("정말로 삭제하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	}
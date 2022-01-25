function submit_check(){
	
	console.log("script run");
	
	if($("#id").val() == "" || $("#pw").val() == "" || $("#re-pw").val() == "" || $("#email").val() == "" || $("#nick").val() == "" || $("#checkbox2").val() == ""){
		return false;
	}
	
}

function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('checkbox');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
}
	
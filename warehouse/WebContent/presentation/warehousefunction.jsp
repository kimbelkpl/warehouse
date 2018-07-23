<script type="text/javascript">



//onload function
	function checkname() {
	
		var val = "";
		<%String name=(String)request.getAttribute("samename");
	
		%>
		var strname='<%=name%>';
		var result=strname.split('#');
		
		
		if(result.length>1)
			{
			
			
				if(result[0]=='Editexist')
				{
					var mess=result[1]+" and "+result[2]+" are  already exist!\n Please re enter your Name and Address";
					
					funNotify(mess,'warn');
								 
					
					document.forms["edit"]["txtName"].value=result[1];
					document.forms["edit"]["txtAddress"].value=result[2];
					document.forms["edit"]["txtPhone"].value=result[3];
					document.forms["edit"]["txtRemark"].value=result[4];
					document.forms["edit"]["eid"].value = result[6];
					
					var flagradio = document.forms["edit"]["disradio"];
					
					if(result[5]==0)
						{
						flagradio[1].checked=true;
						flagradio[0].checked=false;
						}
					else{
						
						flagradio[0].checked=true;
						flagradio[1].checked=false;
					}
					
					$('#newForm').attr('data-target','#rowEd');
					
					$('#newForm').click();
					document.forms["edit"]["txtName"].focus();
					$('#newForm').attr('data-target','#addNew');
					
				}
				else
				{
			
					//alert(result[1]+" and "+result[2]+" are  already exist!\n Please re enter your Name and Address");
					var mess=result[1]+" and "+result[2]+" are  already exist!\n Please re enter your Name and Address";
					
					funNotify(mess,'warn');
					
					document.forms["addform"]["txtName"].value=result[1];
					document.forms["addform"]["txtAddr"].value=result[2];
					document.forms["addform"]["txtPhone"].value=result[3];
					document.forms["addform"]["txtRemark"].value=result[4];
					
					
					$('#newForm').click();
					document.forms["addform"]["txtName"].focus();
					
				}
			}
		else
			{
				if(result=='success')
				{
					funNotify('Insertion Successful','success');
					
					$('#newForm').click();			
					document.forms["addform"]["txtName"].focus();
				}
				
				else if(result=='unsuccess')
				{
					funNotify('Insertion UnSuccessful','error');
					
					$('#newForm').click();
				
				}
				
				else if(result=='editsuccess')
				{
					
					funNotify('Edition Successful','success');
				}
				
				else if(result=='editunsuccess')
				{
					
					funNotify('Edition UnSuccessful','error');
	
				}
				
				else if(result=='deletesuccess')
				{
					
					funNotify('Deletion Successful','success');
	
				}
				
				else if(result=='deleteunsuccess')
				{
					funNotify('Deletion UnSuccessful','error');
					
				}
				
				
				else
					val="";
				
			}
			
			
			
			if(val=='')
				{
				
				}
			else
				{
				alert(val);
				}
	}
	
	
	//for Notification Message
	function funNotify(){
		var mess=arguments[0];
		
		$.notify(mess, {
			//style:'bootstrap',
			autoHide:true,
			clickToHide:true,
			autoHideDelay:3000,
			className:arguments[1],
			
			globalPosition:'top center'
		});
		
	}
	
	
	// Reset Button for Edit Modal 	
	function resetButtonValidate(){
		document.forms[arguments[0]]["txtName"].value="";
		document.forms[arguments[0]]["txtAddress"].value ="";
		document.forms[arguments[0]]["txtPhone"].value = "";
		document.forms[arguments[0]]["txtRemark"].value = "";
	}
	
	
	// Validation for Edit Modal 
	function validate() {
		
			
			var flagradio = document.forms["edit"]["disradio"];
				for (var i = 0; i < flagradio.length; i++) {
				//alert("first for loop");
				if (flagradio[i].checked) {
					val = flagradio[i].value;
				}
				
			}
			if(confirm("Do you want to edit really!"))
			{
				document.forms["edit"]["radioflag"].value = val;
				return true;
			}
			else 
			{
				return false;
			}

	}
	
	//Submit Form for Edit Modal
	function submit() {
		document.forms["edit"]["eid"].value = arguments[0];
		document.forms["edit"]["txtName"].value = arguments[1];
		document.forms["edit"]["txtAddress"].value = arguments[2];
		document.forms["edit"]["txtPhone"].value = arguments[3];
		document.forms["edit"]["txtRemark"].value = arguments[4];

		var flagradio = document.forms["edit"]["disradio"];

		var flag = arguments[5];

		for (var i = 0; i < flagradio.length; i++) {
			if (flagradio[i].value == flag) {
				flagradio[i].checked = true;
				//alert(flag);
				break;

			}
			
		}
		
	}
	
	//For Delete Action
	function confirmDelete() {

		var r = confirm("Are you sure to delete this row");
		if (r) {
			
			location.href = "/warehouse/WarehouseController?page=remove&uid="
					+ arguments[0];
			
		}
	}
	
	//for View Modal
	function viewsubmit() {
		
		document
				.getElementById("txtName").innerHTML = arguments[0];
		document
				.getElementById("txtAddr").innerHTML = arguments[1];
		document
				.getElementById("txtPhone").innerHTML = arguments[2];
		document
				.getElementById("txtRemark").innerHTML = arguments[3];
		document
				.getElementById("txtcid").innerHTML = arguments[4];
		document
				.getElementById("txtcdate").innerHTML = arguments[6];
		document
				.getElementById("txtmid").innerHTML = arguments[5];
		document
				.getElementById("txtmdate").innerHTML = arguments[7];
		if(arguments[8]==1){
			document.getElementById("txtflag").innerHTML = "ON";
		}else document.getElementById("txtflag").innerHTML = "OFF";
		
	}
	
		
	</script>
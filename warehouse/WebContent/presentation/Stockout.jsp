<%@page import="java.util.*"%>
<%@page import="com.java.plyd.service.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>StockOut Information</title>
	
	<%@ include file="link.jsp" %>
<!-- Refresh function -->
   <script>
   		function existorNot(){
   			//alert(arguments[0]);
   		
   			if(arguments[0]=="2"){
   			     document.getElementById("datePickerStockOut").value=arguments[1];
   				document.getElementById("cboFromWarehouse").value=arguments[2];
   				document.getElementById("ty").value=arguments[3];
   				document.getElementById("cboName").value=arguments[4];
   				document.getElementById("Vo").value=arguments[5];
   				document.getElementById("txtRemark").value=arguments[6]; 
   				
   				var type=parseInt(arguments[7]);
   				
   				//alert(arguments[7]);
   			    document.getElementById("ty").options[type].selected=true;
   			   // alert(type);
   			    document.getElementById("ty").onclick();
   			   // alert("end");
   				
   				$(document).ready(function(){
   					$('#btnAddNew').trigger('click');
   				});
   				
   		
   			}
   		}
</script>
</head>
<%
IStock_outService  stock_outService= (IStock_outService) SpringBeanFactory
.getBean("Stock_outService");
List<Stock_out> stock_outList = stock_outService.selectAll();
%>
<!-- Start click event -->
<!-- For Combobox Event(start) -->
<!-- Start onchange combobox javascript-->
 <script type="text/javascript" language="javascript">
 
 var f=document.getElementById("cboName").value;
 <%List<Customer> customerList=(List<Customer>) request.getAttribute("customer");%>
 var w=document.getElementById("cboFromWarehouse").value;
 <%List<Warehouse> warehouselist=(List<Warehouse>) request.getAttribute("warehouse");%>
 </script>
 
 <script type="text/javascript" language="javascript">
	function cat(){
		
		var fcbo=document.getElementById("cboCategory").value;	  
		
		  
		 <%List<Sub_category> sub_categoryList=(List<Sub_category>) request.getAttribute("sub_cate");
		   List<Category> categoryList = (List<Category>) request.getAttribute("category");
		   
		   String cate="";
		   String cateid="";
		   for(Category cat:categoryList){
			   cate+="\'"+cat.getName()+"\',";
			   cateid+="\'"+cat.getCategory_id()+"\',";
			   
		   }
			String subcatName="";
			String subcatid="";
			String subcatto="";
			for(Sub_category subcat:sub_categoryList){
				subcatName+="\'"+subcat.getName()+"\',";
				subcatid+="\'"+subcat.getCategory_id()+"\',";//inside of subcategory =category id
				subcatto+="\'"+subcat.getSub_category_id()+"\',";//inside of subcategory=subcategory id
				
			}
		%>
		    var subcatidarr=[<%=subcatid%>];
		   	var subcatNamearr=[<%=subcatName%>];
		   	var categoryarr=[<%=cate%>];
		   	var cateidarr=[<%=cateid%>];
		    var subcattoarr=[<%=subcatto%>];

		    var scombo=document.getElementById("sub");
		  //clean combobox
		   	  if(scombo==0)
			{
			alert("Empty");
			}
		
		else
			{ 
			var i;
			for(i>=0;i=scombo.options.length-1;i--){
				scombo.remove(i);	
			}
			
			
			} 
		  
		
		    for(var j=0;j<categoryarr.length;j++)
		    	{
		           if(fcbo==categoryarr[j]){
		            	var s=j;
		                     for(var a=0;a<subcatidarr.length;a++){
		                	    if(cateidarr[s]==subcatidarr[a])
		                	    {
		                	    	for(var i=0;i<subcatidarr[a].length;i++)
				                     {
				                       var t=document.createElement("option");
						               t.text=subcatNamearr[a];
						               t.value=subcattoarr[a];
						               scombo.add(t);
				                     } 
		                	    
		                	    }
			                     
		                	    }  
		                     } 
		    	}
			
	}
	
	
</script>
<!-- End onchange combobox javascript-->

<!-- Start second combobox -->
<script type="text/javascript">

function secondcat(){

var secondcombo=document.getElementById("sub").value; 
	 <%List<Brand> brandList = (List<Brand>) request.getAttribute("bl");
	   List<SubCategoryAndBrand> sub_cat_brandList=(List<SubCategoryAndBrand>) request.getAttribute("sub_cat_brand");
	   
	   
	      String brand="";
	      String brandid="";
	      String brandsubcatid="";
	      for(Brand bra:brandList){
	    	  brand+="\'"+bra.getName()+"\',";
	    	  brandid+="\'"+bra.getBrand_id()+"\',";
	      }
	      
	      String sub_brand_id="";
	   	  String sub_sub_cate_id="";
	   	  for(SubCategoryAndBrand scb:sub_cat_brandList){
	   		  sub_brand_id+="\'"+scb.getBrand_id()+"\',";
	   		  sub_sub_cate_id+="\'"+scb.getSub_category_id()+"\',";
	   	  }
	   	 
	     
	   %>
	  
	    var subcatidarr=[<%=subcatid%>];
	   	var subcatNamearr=[<%=subcatName%>];
	   	var brandarr=[<%=brand%>];
	    var subcattoarr=[<%=subcatto%>];
	    var sub_brand_idarr=[<%=sub_brand_id%>];
	    var sub_sub_cate_idarr=[<%=sub_sub_cate_id%>];
	    var brandidarr=[<%=brandid%>];
	    //sub unit
	  
		
	   	var thirdcombo=document.getElementById("third");
	   	thirdcombo.selectedIndex=0;
	   	if(thirdcombo==0){
		           alert("Empty");
		      }
	   	
	     else{
	        	var i;
				for(i>=0;i=thirdcombo.options.length-1;i--){
					thirdcombo.remove(i);	
					}
	       } 

	   	for(var i=0;i<sub_sub_cate_idarr.length;i++){
	   		
	   		 if(secondcombo==sub_sub_cate_idarr[i]){
	   		  
	   			var s=i;
	   			for(var j=0;j<brandidarr.length;j++){
	   				
	   				 if(sub_brand_idarr[s]==brandidarr[j]){
	   					var t=document.createElement("option");
			               t.text=brandarr[j];
			               t.value=brandidarr[j];
			               thirdcombo.add(t);
	   				} 
	   			} 
	   		} 
	   	}  
	
} 
//start for brand
function  brand(){
	  var brand=document.getElementById("third").value;
	  <% List<Merchandise> merList = (List<Merchandise>) request.getAttribute("merchandise");
	     List<Merchandise_Brand> merbrandList=(List<Merchandise_Brand>) request.getAttribute("merchandise_brand");
	         
	         String merbrand_brandid="";
	         String merbrand_merid="";
	         for(Merchandise_Brand mb:merbrandList){
	        	 merbrand_brandid+="\'"+mb.getBrand_id()+"\',";
	        	 merbrand_merid+="\'"+mb.getMerchandise_id()+"\',";
	         }
	      
	        String mername="";
	        String merid="";
	       for(Merchandise  mer:merList){	  
	        	mername+="\'"+mer.getName()+"\',";
	        	merid+="\'"+mer.getMerchandise_id()+"\',";
	        }  
	       
	        %> 
	        
	        var mernamearr=[<%=mername%>];
	        var meridarr=[<%=merid%>]; 
	        var merbrand_brandidarr=[<%=merbrand_brandid%>];
	        var merbrand_meridarr=[<%=merbrand_merid%>];
	        
	        
	        var fourthcombo=document.getElementById("cboMerchandise");
	        fourthcombo.selectedIndex=0;
		   	 if(fourthcombo==0){
			           alert("Empty");
			      }
		        else{
		        	var i;
					for(i>=0;i=fourthcombo.options.length-1;i--){
						fourthcombo.remove(i);	}
		       }
		   	 
		 	for(var i=0;i<merbrand_brandidarr.length;i++){
		   		
		   		 if(brand==merbrand_brandidarr[i]){
		   		  
		   			var s=i;
		 
		   			 for(var j=0;j<meridarr.length;j++){
		   				
		   				 if(merbrand_meridarr[s]==meridarr[j]){
		   					
		   					var t=document.createElement("option");
				               t.text=mernamearr[j];
				               fourthcombo.add(t);
		   				} 
		   			}  
		   		} 
		   	}  
		 	
		 	
}
</script> 
<!-- End Second Combobox -->
  
  
  <!-- function for add new table -->
  <script src="jquery.js"></script>
  <script type="text/javascript">

  var tb= document.getElementById("table");
  
  <%List<Stock_Balance> sList=(List<Stock_Balance>) request.getAttribute("balanceList");
 	 String qty="";
  	 String bal_merid="";
  	 String bal_warid="";
 	 for(Stock_Balance s:sList){
	  	qty+="\'"+s.getQty()+"\',";
		bal_merid+="\'"+s.getMerchandise_id()+"\',";
		bal_warid+="\'"+s.getWarehouse_id()+"\',";
	  }
 	 String vou="";
 	 for(Stock_out stout:stock_outList){
 		 vou+="\'"+stout.getVr_no()+"\',";
 	 }
%>
  var bal_meridarr=[<%=bal_merid%>];
  var bal_qtyarr=[<%=qty%>];
  var bal_waridarr=[<%=bal_warid%>];
  var vouarr=[<%=vou%>];
 
      $(document).ready(function(){
          $("#add-row").click(function(){
        	  var warehouse=document.getElementById("cboFromWarehouse").value;
        	  alert(warehouse);
        	  var name_error= document.getElementById("name_error");
        	  var txtQty=document.getElementById("txtQty");
        	  var merid=$("#merchandise").val();
              var merchandise = $("#cboMerchandise").val();
              
              var qty=parseInt($("#txtQty").val());
              var subunit = $("#cbosubunit").val();
              var voucher = $("#Vo").val();
              var remark = $("#txtRemark").val();
        	  var warid=document.getElementById("hid").value;
        	  
        	  for(var i=0;i<vouarr.length;i++){
        		  if(voucher==vouarr[i]){
        			  var eqvou=vouarr[i];
        			  break;
        		  }
        	  }
        	  
        	  if(isNaN(qty)||qty<1){
        		  txtQty.style.border = "3px solid red";
                  name_error.innerHTML = "Please re-enter quantity";
                  return false;
        	      document.getElementById("txtQty").value=null;
        	    }
        	  
        	  else if(voucher==eqvou){
        		  alert("there is an existing voucher no in stock out");
        	  }
        	  
        	  else if(warehouse=="Seleted Warehouse"){
        		  alert("Please enter warehouse name first");
        	  }
        	  
        	  else if(voucher!=eqvou){
        	    for(var i=0;i<bal_meridarr.length;i++){
        		  if(merid==bal_meridarr[i] && warid==bal_waridarr[i]){
        			  var s=i;
        			  if(qty < bal_qtyarr[s]){
        				  bal_qtyarr[s]=bal_qtyarr[s]-qty;
        				  var markup = "<tr><td><center><input type='hidden' name='merid' value='"+merid+"'/>"+merid+"</center></td><td><input type='hidden' name='arrMerchandise' value='"+merchandise+"'/>"+merchandise+"</td><td><input type='hidden' name='arrtxtQty' value='"+qty+"'/>"+qty+"</td><td><input type='hidden' name='cbosubunit' value='"+subunit+"'/>"+subunit+"</td><td><input type='hidden' name='Vo' value='"+voucher+"'/>"+voucher+"</td><td><input type='hidden' name='txtRemark' value='"+remark+"'/>"+remark+"</td><td><input type='checkbox' name='record'/> <input type='hidden' name='balindex' value='"+s+"'/></td></tr>";
        				  $("#table1 tbody").append(markup);
        				  txtQty.style.border = "3px solid #00e600";
        	              name_error.innerHTML ="<div class='cor'>Correct Input</div>";
        			  }
        			  
        		   
        			 else if(bal_qtyarr[s] < qty){
        				  txtQty.style.border = "3px solid red";
        				  name_error.innerHTML =bal_qtyarr[s]+"  quantities are remaining in this merchandise";
                  
        			  } 
        		  }
        	  }  
             
          }

          });
          
          // Find and remove selected table rows
          $("#delete-row").click(function(){
        	  var result=0;
        	
        	  var qtyarr=document.getElementsByName('arrtxtQty');
        	  var balanceqty=document.getElementsByName('balindex');
        	  var i=0;
        	  
        	
              $("#table1 tbody").find('input[name="record"]').each(function(){
              	if($(this).is(":checked")){
              	  
              	   var r=parseInt(qtyarr[i].value);
              	   var resultbal=balanceqty[i].value;
                  			  result=resultbal;
                  			  bal_qtyarr[resultbal]=bal_qtyarr[resultbal]+r;
                                
                  			  
          				
       			 
                      $(this).parents("tr").remove();
                      i--; 
       			
                  }
              	
              	i++;
              });
          });
      });    
  </script>
 

  
  <!--For Warehouseid  -->
   <script type="text/javascript">
  function warehouse(){
	//  List<warehouse> warehouselist = (List<warehouse>) request.getAttribute("warehouse");
	  var ware=document.getElementById("cboFromWarehouse").value;
	
	  <%
	  String warename="";
	  String wareid="";
	  for(Warehouse ware:warehouselist){
		  warename+="\'"+ware.getWareName()+"\',";
		  wareid+="\'"+ware.getId()+"\',";
	  }
	  %>
	  var warenamearr=[<%=warename%>];
	  var wareidarr=[<%=wareid%>];
	  var count=0;
	  for(var i=0;i<warenamearr.length;i++){
		  if(ware==warenamearr[i]){
			  count=i;
			  
			  break;
		  }
	  }
	 
	  document.getElementById("hid").value=wareidarr[count];
  }
    
  
  </script> 
  
  <!-- Catch id -->
 <script>
function mer(){
		 var mer=document.getElementById("cboMerchandise").value;
		 var merchannamearr=[<%=mername%>];
		 var merchanidarr=[<%=merid%>];
		 var meridarr=[<%=merid%>];
		 var count=0;
		for(var i=0;i<merchannamearr.length;i++){
				if(mer==merchannamearr[i]){
				count=i;
				break;
				}
		}
		document.getElementById("merchandise").value=meridarr[count];	
		
		//start for subunit
		<%List<Subunit_Merchandise> unit_categoryList=(List<Subunit_Merchandise>) request.getAttribute("unit_category");
	 	  List<SubUnit> subunitlist=(List<SubUnit>) request.getAttribute("subunit");
		   
	 	   String newid="";
		   String newunitname="";
		   for(SubUnit sub:subunitlist){
			   newunitname+="\'"+sub.getName()+"\',";
			   newid+="\'"+sub.getSub_unit_id()+"\',";
			   
		   }
	
		   
		   String betsubunit="";
		   String betmerchandise="";
		   for(Subunit_Merchandise sub:unit_categoryList){
			   betsubunit+="\'"+sub.getSub_unit_id()+"\',";
			   betmerchandise+="\'"+sub.getmerchandise_id()+"\',";
		   }
		   %>
  
	 	  var betsubunitarr=[<%=betsubunit%>];
		  var betmerchandisearr=[<%=betmerchandise%>];
		  var unitcbo=document.getElementById("cbosubunit");
		  unitcbo.selectedIndex=0;
		  
		   var newidarr=[<%=newid%>];
		   var newunitnamearr=[<%=newunitname%>]; 
		  
		  if(unitcbo==0)
		   {
		   alert("Empty");
		   }
	   else
		   {
		   var i;
		   for(i>0 ;i=unitcbo.options.length-1;i--){
			   unitcbo.remove(i);
		   }
		   }
		  

		   	for(var i=0;i<merchannamearr.length;i++){
		   		
		   		  if(mer==merchannamearr[i]){
		   		 
		   			 var s=i;
		   			for(var j=0;j<betmerchandisearr.length;j++){
		   				
		   				 if(merchanidarr[s]==betmerchandisearr[j]){
		   					 
		   					  var z=j;
		   					  for(var y=0;y<newidarr.length;y++){
		   						  if(betsubunitarr[z]==newidarr[y]){
		   					      var t=document.createElement("option");
				                  t.text=newunitnamearr[y];
				                   unitcbo.add(t); 
		   						  }
		   					  }
		   				} 
		   			}  
		   		} 
		   	} 
		   	
		   	//end sub unit
	} 
	
	
</script> 
  
<!-- End click event -->
<body class="w3-container w3-light-gray" onload="existorNot('<%out.print(request.getAttribute("exist"));%>','<%out.print(request.getAttribute("date"));%>','<%out.print(request.getAttribute("f"));%>','<%out.print(request.getAttribute("type"));%>','<%out.print(request.getAttribute("sel"));%>','<%out.print(request.getAttribute("vou"));%>','<%out.print(request.getAttribute("remar"));%>','<%out.print(request.getAttribute("contype"));%>')">
	<%@ include file="header.jsp" %>

				<div class="row panel-body p10">
					<!-- inserting the code for each operation -->
					<div class="col-sm-9">
						<div class="row p10">
							<div class="panel panel-default">
						  		<div class="panel-heading w3-container w3-light-blue p10">
						  			<button type="button" class="btn w3-container w3-light-blue p-header-btn" data-toggle="modal" data-target="#addNew" id="btnAddNew"><span class="glyphicon glyphicon-plus"></span> Add New</button> 		  			
			  						<span class="dropdown">
			  							<button type="button" class="btn w3-container w3-light-blue p-header-btn dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span> Tools <span class="caret"></span></button>
										  <ul class="dropdown-menu p10">
										    <li class="w3-container w3-text-black w3-hover-blue w3-hover-text-white p10"><span class="glyphicon glyphicon-import"></span> Import Files</li>
										    <li class="w3-container w3-text-black w3-hover-blue w3-hover-text-white p10"><span class="glyphicon glyphicon-export"></span> Export Files</li>
										    <li></li>
										  </ul>
			  						</span>			  						
						  		</div>

						  		<!--end of Body column -->
						  		<!--Panel-->


					<div class="panel-body p10">
						  			<!-- start of search result table -->
						  				<%
						  				
							
							IUserService userservice=(IUserService)SpringBeanFactory.getBean("UserService");
						

		%>
									<style>
								
									#example tbody tr:hover { background-color: skyblue; cursor:pointer;
									
									}
									</style>
						  			<table id="example"  class="table table-condensed table-bordered p10">
						  				<caption class="w3-container w3-text-black w3-myfont"> StockOut Information Lists</caption>
									    <thead class="w3-container w3-light-blue p10">
									      <tr>
									        <th>Stock Out Date</th>
									        <th>From Warehouse</th>
									        <th>To WareHouse</th>
									        <th>Customer</th>
									        <th>VoucherNO</th>
									        <th>Remark</th>
									        <th>Flag</th>
									        <th>Option</th>
									      </tr>
									    </thead>
									    <tbody>
						
							<%
							for (Stock_out user : stock_outList) {
						%>
						<tr>
							<td>
								<%
									out.println(user.getStock_out_date());
								%>
							</td>
							
							<td>
								<%
									out.println(user.getFromwarehouse_id());
								%>
							</td>
							<td>
								<%
									out.println(user.getTowarehouse_id());
								%>
							</td>
							<td>
								<%
									out.println(user.getCustomer_id());
								%>
							</td>
							<td>
								<%
									out.println(user.getVr_no());
								%>
							</td>
							<td>
								<%
									out.println(user.getRemark());
								%>
							</td>
								<%
									
										User u2 = userservice.selectUser(user.getCreateUserId());
										User u1 = userservice.selectUser(user.getModifiedUserId());
								%>
								<%if(user .getFlag()==1){ %>
								<td> <font color="green">ON</font></td>
								<%} else { %>
								<td><font color="red">OFF</font></td>
								<%} %>
							
							   <td class="dropdown">
									        	<button class="btn w3-container w3-white w3-text-blue w3-hover-blue w3-hover-text-white ptb dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span>
									      		</button> 
									      		<ul class="dropdown-menu">
												    <li class="w3-container w3-hover-blue p10" onclick="goToView('<%out.print(user.getStock_out_id());%>')"><span class="glyphicon glyphicon-eye-open"></span> View</li>
												    <li class="w3-container w3-hover-blue p10"  data-toggle="modal" data-target="#rowEd" 
												    	onclick="submit('<%out.print(user.getStock_out_id()); %>','<%out.print(user.getStock_out_date());%>','<%out.print(user.getFromwarehouse_id());%>','<%out.print(user.getTowarehouse_id());%>','<%out.print(user.getCustomer_id());%>','<%out.print(user.getVr_no());%>','<%out.print(user.getRemark());%>','<%out.print(user.getFlag());%>')"><span class="glyphicon glyphicon-edit"></span> Edit</a></li>
												   <%if(user.getFlag()==1){ %>				
													    <li class="w3-container w3-hover-blue p10" onclick="confirmDelete('<%out.print(user.getStock_out_id());%>')"> 
													    	<span class="glyphicon glyphicon-remove-circle"></span> Delete</li>
												    <%} else { %>
												    	<li class="w3-container w3-hover-red p10 disabled"> <font color="gray">
													    	<span class="glyphicon glyphicon-remove-circle"></span> Delete</font></li>
												    <%} %>
												</ul>
												<script>
												//For go to View
												function goToView(){
													location.href="/warehouse/Stock_outController?page=view&voucher="+arguments[0];
												}
												//End for go to view
									
												
											function submit(){
												
												//var ta=arguments[4];
													 	document.forms["edit"]["stock_outid"].value=arguments[0];
												 	   document.forms["edit"]["datePickerStockOut"].value=arguments[1];
														document.forms["edit"]["cboFromWarehouse"].value=arguments[2];
														document.forms["edit"]["cboToWarehouse"].value=arguments[3];
														//alert(arguments[4]);
														document.forms["edit"]["cboCustomer"].value=arguments[4];
														document.forms["edit"]["Vo"].value=arguments[5];
														document.forms["edit"]["txtRemark"].value=arguments[6]; 
														 document.forms["edit"]["flag"].value=arguments[7];
														
														
														if(arguments[7]==1){
															document.getElementById("idtxtFlag1").checked=true;
															document.getElementById("idtxtFlag2").checked=false;
														}else{
															document.getElementById("idtxtFlag2").checked=true;
															document.getElementById("idtxtFlag1").checked=false;
														} 
													}
													function confirmDelete() {
						
														var r=confirm("Are you sure to delete this row");
												  	if(r){
												  		location.href="/warehouse/Stock_outController?page=remove&stock_outid="+arguments[0];
												  		}
													}
													
												</script>
									        </td>
									      </tr>
									       <%} %>
									    </tbody>
									  </table>
						  			<!-- end of search result table -->
						  		</div>
							</div>
						</div>
					</div>
					<!-- end of inserting the code for each operation -->
<!-- Hidden -->
<input type="hidden" id="merchandise" >

<!-- start of Modal for add new the row -->
					<div class="modal fade" id="addNew" role="dialog">
					    <div class="modal-body">
					    
					      <!-- Modal content-->
					      	<div class="modal-content">
					        	<div class="modal-header w3-container w3-light-blue p10">
					         		<button type="button" class="close" data-dismiss="modal">&times;</button>
					          		<h4 class="modal-title">Adding new StockOut data</h4>
					       		</div>
					       		<script>
function validate(){
	var mm=document.getElementsByName("arrMerchandise");
	if(mm.length>0){
		if(confirm("Are You Sure To INSERT!!")){
			return true;
		}else
			{
			return false;
			}	
	}else{
		alert("Firstly, You need to add data to table!\n Click 'Add Row' Button");
		return false;
	}
}
</script>
					       		<form action="/warehouse/Stock_outController" onsubmit="return validate()">
						        <div class="modal-body p10">
						          	<p>StockOut Entry</p>
						        </div>
<!--StockIn Table-->




    <div class="container">
 <h2>Stock Out</h2><br><br>
      <div class="row">
      <input type="hidden" name="txtstock_out" id="txtstock_out" >
      <div class="col-sm-4"> 
      <label for="lblConArriDate">Stock Out Date</label><br>
      <input type="date" class="form-control" id="datePickerStockOut" name="datePickerStockOut" required><br>
      </div>
      
      <div class="col-sm-4">
      <label for="lblStockInDate">From WareHouse</label><br>
       <select class="form-control" id="cboFromWarehouse"   name="cboWarehouse"   onchange="warehouse()" required>
   <option disabled selected>Seleted Warehouse</option>
     <%for (Warehouse w:warehouselist) {%>
     <option><%out.println(w.getWareName());%></option>
     <%} %>
      </select>
      <!--Hidden  -->
  <input type="hidden" id="hid" name="cboFromWarehouse" value="<%out.print(request.getAttribute("warid"));%>"> 
  <input type="hidden" id="towareid" name="towareid">
      </div>
      
      <div class="col-sm-4">
      <label for="lblWarehouse"> Type </label><br>
      <div class="dropdown">
      <select class="form-control" id="ty" name="ty" onclick="selecttype()" required>
      <option disabled selected>Selected Type</option>
      <option>To Customer</option>
      <option>To Warehouse</option>
      <option>Damage</option>
      </select>
      </div>
      </div>
      </div>
     
   <!-- end of first row -->  
   
   <!-- hidden for type combobox --> 
   <input type="hidden" id="hidtype" name="hidtype">
   <script>
   		function selecttype(){
   			var typeid=document.getElementById("ty");
   			var typeindex=typeid.selectedIndex;
   			document.getElementById("hidtype").value=typeindex;
   		
   			var f=document.getElementById("cboName");
   			var type=document.getElementById("ty").value;
   			f.selectedIndex=0;
   			<%
				String cusname="";
   				for(Customer c:customerList){
   				   cusname+="\'"+c.getName()+"\',";
   				}
   				
   				String warname="";
   				for (Warehouse w:warehouselist){
   					warname+="\'"+w.getWareName()+"\',";
   				}
   				
			%>
			var cusname=[<%=cusname%>];
			var warname=[<%=warname%>];
   			document.getElementById("txtRemark").value=type;
   			
   		 if(f==0)
			{
				alert("Empty");
			}
		
		else
			{ 
				var i;
				for(i>=0;i=f.options.length-1;i--){
				f.remove(i);	
			}
			
			
			}
   		 
   			if(type=='To Customer'){
   			  document.getElementById("cboName").disabled=false;
   			document.getElementById("Vo").disabled=false;
   			  document.getElementById("lb").innerHTML="Customer Name";
   			  document.getElementById("sel").innerHTML="Select Customer Name";
   			  for(var i=0;i<cusname.length;i++){
   				  var t=document.createElement("option");
   				  t.text=cusname[i];
   				  f.add(t);
   				  
   			  }
   			}
   			else if(type=='To Warehouse'){
   				document.getElementById("cboName").disabled=false;
   				document.getElementById("Vo").disabled=false;
   				document.getElementById("lb").innerHTML="Warehouse Name";
   				document.getElementById("sel").innerHTML="Select Warehouse Name";
   				document.getElementById("txtRemark").value="Changing Warehouse";
   				for(var i=0;i<warname.length;i++){
     				  var t=document.createElement("option");
     				  t.text=warname[i];
     				  f.add(t);
     				  
     			  }
   			}
   			
   			else if(type=='Damage'){
   				document.getElementById("lb").innerHTML="Default";
   				document.getElementById("sel").innerHTML="Default";
   				document.getElementById("cboName").disabled=true;
   				document.getElementById("Vo").disabled=true;
   				
   			}
   		}
   		
   		//<!-- Warehouse Condition -->
        function wareconvert(){
          var fware=document.getElementById("cboFromWarehouse").value;
          var tware=document.getElementById("cboName").value;
          var twareee=document.getElementById("cboName");
          
          if(fware==tware){
            alert("Dont match warehouse each other!");
            twareee.selectedIndex=0;
            
          }
          var toware=document.getElementById("cboName").value;
		  var warenamearr=[<%=warename%>];
		  var wareidarr=[<%=wareid%>];
		  var count=0;
		 
		  for(var i=0;i<warenamearr.length;i++){
			  if(toware==warenamearr[i]){
				  count=i;
				  
				  break;
			  }
		  }
		  document.getElementById("towareid").value=wareidarr[count];
          
        }
    
   </script>
   
      

     <!-- customer -->
      <div class="row">
      
      <div class="col-sm-4">
      <label for="lblCustomer" id="lb">Default</label><br>
      <div class="dropdown">
      <select class="form-control" id="cboName" name="cboName" onclick="wareconvert()" required>
      <option disabled selected id="sel">Select Name</option>
      </select>
      </div>
      </div>
      
      <div class="col-sm-4">
      <label for="lblVNo">Voucher No</label><br>
      <input type="text" class="form-control" id="Vo" name="Vo" required><br><br>
      </div>
      
      <div class="col-sm-4">
      <label for="lblVNo">Remark (Default)</label><br>
      <input type="text" class="form-control" id="txtRemark" name="txtRemark" required><br><br>
      </div>
      </div>
      </div>
     <!-- end of sec row -->  
      
     <div class="container">
     <div class="row">
     
     <div class="col-sm-4">
      <label for="lblCategory">Category</label><br>
      <div class="dropdown">
     <select class="form-control" id="cboCategory" name="cboCategory" onchange="cat()">
        <option >Selected Category</option>   
      <% for(Category ca:categoryList){%>
      <option ><%out.println(ca.getName()); %></option>
      <%} %>
      </select>
      </div>
      </div>

<div class="col-sm-4">
      <label for="lblSubCategory">SubCategory</label><br>
      <div class="dropdown">
      <select class="form-control" name="cboSubCategory"  id="sub" onchange="secondcat()">
      <option>Selected Sub Category</option>
      </select>
      </div> <br><br>
      </div>

      <div class="col-sm-4">
      <label for="lblBrand">Brand</label><br>
      <div class="dropdown">
      <select class="form-control" id="third" onchange="brand()" name="cboBrand" >
      <option>Selected Brand</option>
      </select>
      </div> <br><br>
      </div>
</div>
<!-- end of third row -->


     <div class="row">
       <div class="col-sm-4">
      <label for="lblMerchandise">Merchandise Name</label><br>
      <div class="dropdown">
      <select class="form-control" id="cboMerchandise" name="cboMerchandise" onchange="mer()">
      <option>Selected Merchandise</option>
      </select>
      <input type="hidden" id="merchandise" name="cboMerchandise" >
      </div> 
      </div>
      
      <div class="col-sm-4">
      <label for="lblsubunit">Sub Unit</label><br>
      <div class="dropdown">
      <select class="form-control" id="cbosubunit" name="cbosubunit">
      <option>Selected Sub Unit</option>
      
      </select>
      </div> 
      </div>
      
<div class="col-sm-4">
      <label for="lblWarehouse">Qty</label><br>
      <input type="text" class="form-control" id="txtQty" name="txtQty"   required>
      <div id="name_error" class="var_error"></div>
      <br>
</div>
</div>



<div class="row">
     <div class="col-sm-6">
     <center> <input type="button" id="add-row" class="btn btn-default w3-container w3-light-blue p10" value="Add Row" onclick="hello()"></center>
     </div>
     <div class="col-sm-6">
     <center><button type="button" id="delete-row" class="btn btn-default w3-container w3-light-blue p10">Delete Row</button></center>
     </div>
     </div>
     </div><br><br>
   <!-- end of combo and text box -->
   <!-- check qty -->



<!-- table -->
<div class="container">
<style>
#table1 tbody tr{
transition:all .25s ease-in-out
}
#table1 tbody tr:hover { background-color: skyblue; cursor:pointer;
}

.var_error{
    color: red;
  }
.cor{
  color:#00e600;
  font-size:20px;
  
}
</style>
 <table class="table" border="2" id="table1" >
      
     <thead> <tr>
    	<th>Merchandise Id</th>
        <th>Merchandise Name</th>
        <th>Qty</th>
        <th>Sub Unit</th>
        <th>Voucher No</th>
        <th>Remark</th>
        <th>Selected</th>
      </tr>
      </thead>
      <tbody>
      </tbody>
      </table>
  </div>
 
<!--footer modal -->

    <div class="modal-footer p10">
						        	
    <input type="submit" class="btn btn-default w3-container w3-light-blue p10" name="page" value="SubmitAdd" />
    <button type="reset" class="btn btn-default w3-container w3-light-blue p10">Cancel</button>
    <button type="button" class="btn btn-default w3-container w3-light-blue p10" data-dismiss="modal">Close</button>
	</div>
</form>
</div>					      
</div>
</div>
<!-- end of the add new of the row -->


<!-- Start Edit -->

<div class="modal fade" id="rowEd" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      	<div class="modal-content">
					        	<div class="modal-header w3-container w3-light-blue p10">
					         		<button type="button" class="close" data-dismiss="modal">&times;</button>
					          		<h4 class="modal-title">Editing Stock Out Information</h4>
					       		</div>
					       		
						        <div class="modal-body p10">
						          	<p>Stock Out Detail Edit</p>
						        </div>
						        
<form name="edit" action="/warehouse/Stock_outController" onsubmit="return confirmEdit()">
	<input type="hidden" name="stockid" value="<%out.print(session.getAttribute("stockidses"));%>">
<script type="text/javascript">
function confirmEdit()
{
	if(confirm("Do you want to edit really! ! !")){
		alert ("Edit Successfully......");
		return true;
	}
	else{
		return false;
	}
}

</script>


 	

<div class="row">
<style>

	td{
		text-align: left;
        padding: 5px;
	    padding-left: 60px;
}
</style>
<table >
<tbody align="center">

 	<tr>
	<td><b>Stock Out ID:</b></td>
	<td><input type="text" class="form-control" id="stock_outid" name="stock_outid"></td>
	</tr>
 	<tr>
	<td><b>StockOutDate:</b></td>
	<td><input type="date" class="form-control" id="datePickerStockOut" name="datePickerStockOut"></td>
	</tr>
		<tr>
	<td><b>FromWareHouse:</b></td>
	
	  <td><select class="form-control" id="cboFromWarehouse" name="cboWarehouse"  >
      <option disabled selected>Select WareHouse </option>
      <%for (Warehouse w:warehouselist) {%>
     <option><%out.println(w.getWareName()) ;%></option>
     <%} %>
      </select>
     </td>
	</tr>
 
      	<tr>
	<td><b>ToWareHouse:</b></td>
	
	  <td><select class="form-control" id="cboToWarehouse" name="cboToWarehouse" onchange="wareconvert()" >
      <option disabled selected>Select WareHouse </option>
      <%for (Warehouse w:warehouselist) {%>
     <option><%out.println(w.getWareName()) ;%></option>
     <%} %>
      </select>
     </td>
	</tr>
    
     	<tr>
	<td><b>Customer Name:</b></td>
	<td> <select class="form-control" id="cboCustomer"  name="cboCustomer" required>
      <option disabled selected>Select Customer</option>
      <%
      List<Customer> customerList1=(List<Customer>)request.getAttribute("customerList1");
      for(Customer c:customerList1){   %>
      <option><%out.println(c.getName());  %></option>
      <%} %>
      </select></td>
	</tr>
     
    <tr>
	<td><b>Voucher No:</b></td>
	<td><input type="text" class="form-control" id="Vo" name="Vo"></td>
	</tr>
      <tr>
	<td><b>Remark:</b></td>
	<td><input type="text" class="form-control" id="txtRemark" name="txtRemark"></td>
	</tr>
    <tr>
	
	<td>Flag:</td>
<td> 	<input type="hidden" name="flag" id="flag" />
    <input type="radio" value="1" name="txtFlag" id="idtxtFlag1"/><font color="green">ON</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="radio" value="0" name="txtFlag" id="idtxtFlag2"/><font color="red">OFF</font></td>
	</tr>

  </tbody>
</table>
</div>

  
      <br>
      <br>
     
     
 
<!--footer modal -->

    <div class="modal-footer p10">
						        	
    <button type="submit" class="btn btn-default w3-container w3-light-blue p10" name="page" value="Edit" >Edit</button>
    <button type="reset" class="btn btn-default w3-container w3-light-blue p10">Cancel</button>
    <button type="button" class="btn btn-default w3-container w3-light-blue p10" data-dismiss="modal">Close</button>
	</div>
</form>
</div>					      
</div>
</div>


<!-- end of Edit -->






 <!--Searching StockIn Data-->
<%@ include file="right.jsp" %>
</body>
</html>
	<%String uname=(String)session.getAttribute("uname");
int uid=((Integer)(session.getAttribute("uid")));
session.setAttribute("uname", uname);
session.setAttribute("uid",uid);
%>
	<div class="container-fluid" style="width:100%;height:98vh;overflow:hidden;">
		<!-- nav bar -->
		<div class="row w3-container w3-light-blue" style="border-top-left-radius: 5px;border-top-right-radius: 5px;">
			<div class="col-sm-8">
				<img src="images/warehouse_logo.png" style="width:auto;height:70px;"/>
			</div>
			<div class="col-sm-4 btn-group navbar-right">
			  	<button type="button" class="btn w3-container w3-light-blue p-header-btn"><span class="glyphicon glyphicon-cog"></span> Setting</button> 
			  	<button type="button" class="btn w3-container w3-light-blue p-header-btn"><span class="glyphicon glyphicon-user"></span> <%=uname %></button>
			  	<button type="button" class="btn w3-container w3-light-blue p-header-btn"> <span class="glyphicon glyphicon-question-sign"></span> Help</button>
			  	<a href="/warehouse/UserController?page=logout"><button type="button" class="btn w3-container w3-light-blue p-header-btn"><span class="glyphicon glyphicon-log-out"></span> Logout</button></a>
			</div> 
		</div>
		<!-- end of nav bar -->
		<!-- 3 column dividing for body -->
		<div class="row">
			<!-- left column -->
			<div class="col-sm-2 panel panel-default panel1" style="height:90vh;overflow:auto;">
				<!-- for tile of the body -->
				<div class="row panel-heading p10 w3-container w3-white" style="top:0;position:sticky;z-index: 1;">
					<b>Menu</b>
				</div>
				<!-- for body part of the body column -->
				<div class="panel-body p10">
					<!-- start pannel -->
					<div class="row">
						<div class="panel panel-default">
						 	<div class="panel-body">
						 		<h3><img src="images/dash board.png"> Profile</h3>
						 		<ul class="l-non">
						 			<li><a href="/warehouse/UserController?page=userProfile"><span class="glyphicon glyphicon-chevron-right"></span> User Profile</a></li>
						 			<li><a href=""><span class="glyphicon glyphicon-chevron-right"></span> Company Profile</a></li>
						 		</ul>
						 	</div>
						</div>
					</div>
					
					<!-- end of pannel -->
					<!-- start pannel -->
					<div class="row">
						<div class="panel panel-default">
						 	<div class="panel-body">
						 		<h3><img src="images/account.png"> Account</h3>
						 		<ul class="l-non">
						 			<li><a href="/warehouse/CustomerController?page=Customer"><span class="glyphicon glyphicon-chevron-right"></span> Customer List</a></li>
						 			<li><a href="/warehouse/SupplierController?page=Supplier"><span class="glyphicon glyphicon-chevron-right"></span> Supplier List</a></li>
						 			<%if(uid==1){ %>
						 			<li><a href="/warehouse/UserController?page=userform"><span class="glyphicon glyphicon-chevron-right"></span> User List</a></li>
						 			<li><a href="/warehouse/User_LevelController?page=userlevel"><span class="glyphicon glyphicon-chevron-right"></span> User Level</a></li>
						 			<%} %>
						 		</ul>
						 	</div>
						</div>
					</div>
					
					<!-- end of pannel -->
					<!-- start pannel -->
					<div class="row">
						<div class="panel panel-default">
						 	<div class="panel-body">
						 		<h3><img src="images/inventory.jpg"> Inventory</h3>
						 		<ul class="l-non">
						 			<li><a href="/warehouse/CategoryController?page=categoryform"><span class="glyphicon glyphicon-chevron-right"></span> Category</a></li>
						 			<li><a href="/warehouse/Sub_category_controller?page=subcategoryform"><span class="glyphicon glyphicon-chevron-right"></span> Sub Category </a></li>
						 			<li><a href="/warehouse/BrandController?page=brandform"><span class="glyphicon glyphicon-chevron-right"></span> Brand</a></li>
						 			<li><a href="/warehouse/BasicUnitController?page=basicunitform"><span class="glyphicon glyphicon-chevron-right"></span> Basic Unit</a></li>
						 			<li><a href="/warehouse/SubUnitController?page=subunitform"><span class="glyphicon glyphicon-chevron-right"></span> Sub Unit</a></li>
						 			<li><a href="/warehouse/MerchandiseController?page=Merchandise"><span class="glyphicon glyphicon-chevron-right"></span> Merchandise</a></li>
						 			<li><a href="/warehouse/Stock_inController?page=load"><span class="glyphicon glyphicon-chevron-right"></span> StockIn</a></li>
						 			<li><a href="/warehouse/Stock_inController?page=stockindetaillist"><span class="glyphicon glyphicon-chevron-right"></span> StockIn Detail</a></li>
						 			<li><a href="/warehouse/Stock_outController?page=stockoutform"><span class="glyphicon glyphicon-chevron-right"></span> StockOut</a></li>
						 			<li><a href="/warehouse/Stock_outController?page=stockoutdetaillist"><span class="glyphicon glyphicon-chevron-right"></span> StockOut Detail</a></li>
						 			<li><a href="/warehouse/StockBalanceController?page=stockbalanceform"><span class="glyphicon glyphicon-chevron-right"></span> Stock Balance</a></li>
						 			<li><a href="/warehouse/DamageController?page=damage"><span class="glyphicon glyphicon-chevron-right"></span> Damage</a></li>
						 		</ul>
						 	</div>
						</div>
					</div>
					
					<!-- end of pannel -->
					<!-- start pannel -->
					<div class="row">
						<div class="panel panel-default">
						 	<div class="panel-body">
						 		<h3><img src="images/warehouse.png"> Building</h3>
						 		<ul class="l-non">
						 			<li><a href="/warehouse/WarehouseController?page=warehouseform"><span class="glyphicon glyphicon-chevron-right"></span> Warehouse</a></li>
						 			<li><a href=""><span class="glyphicon glyphicon-chevron-right"></span> Store</a></li>
						 		</ul>
						 	</div>
						</div>
					</div>
					
					<!-- end of pannel -->
				</div>
			</div>
			<!-- body column -->
			<div class="col-sm-10 panel panel-default panel1" style="height:90vh;overflow-y:scroll;overflow-x:hidden;">
				<!-- for tile of the body -->
				<div class="row panel-heading p10 w3-container w3-white" style="top:0;position:sticky;z-index: 2;">
					<b>Showing Information</b>
				</div>
				
				<!-- for body part of the body column -->
				<div class="row panel-body p10">
				
			
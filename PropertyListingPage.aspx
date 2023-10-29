<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PropertyListingPage.aspx.cs" Inherits="RoomMateWebsite.PropertyListingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Flats</title>
	<link rel="stylesheet" href="StyleSheets/StyleSheet1.css"/>
	<link rel="stylesheet" href="StyleSheets/StyleSheet2.css"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="HomeMain">
			<div class="HomeHeaderDiv">
				<div>
					<div class="BrandNameDiv"><h3 class="BrandName">Room<span class="GreenSpan">Mate</span><sup class="SupScript">R</sup></h3></div>
					<div id="NormalHomePage" class="HomeHeaderDivRight" >
						<input type="button" class="BtnHomeSignIn" id="SignInRedirect" value="Sign in" onclick="SignIn()" />
						<input type="button" class="BtnHomeSignUp" id="SignUpRedirect" value="Sign Up" onclick="SignUp()" />
						<input type="button" class="BtnDownLoadApp" value="Download App" onclick="DownloadApp()" />
					</div>
					<div id="LoggedInDiv" class="LoggedInDiv" style="display:none;">
						<input type="button" class="BtnMyTeam" value="My Team" onclick="MyTeam()" />
						<input type="button" class="BtnAddListing" value="+ Add Listing" onclick="NavToAddListing()" />
						<img src="Images/ProfileLogo.jpeg" class="ProfileLogo" id="ProfileLogo" onclick="ProfileOptions()" />
						<ul class="profileDD" id="profileDD"></ul>
					</div>
					<div class="MobNavBar" id="MobNavBar" style="display:none" onclick="OpenMobNavBar()">
						<div class="MobNavBarOne" id="MobNavBarOne"></div>
						<div class="MobNavBarTwo" id="MobNavBarTwo"></div>
						<div class="MobNavBarThree" id="MobNavBarThree"></div>
					</div>
					<div class="OpenedMobNavBar" id="OpenedMobNavBar" style="display:none">
						<input type="button" class="BtnHomeSignIn" id="SignInRedirect" value="Sign in" onclick="SignIn()" />
						<input type="button" class="BtnHomeSignUp" id="SignUpRedirect" value="Sign Up" onclick="SignUp()" />
					</div>
				</div>
				<span class="NavBar"><a id="NavHome" href="HomePage.aspx">Home</a> / <a href="PropertyListingPage.aspx">Property</a> / <a id="CityNameAnchor" href=""></a></span>
				<div class="FilterDiv">
					<div>
						<p>Rooms on Rent, Shared Accommodation & Roommates in <span id="CityName"></span></p>
					</div>
					<div>
						<input type="text" class="Box BxPlaceName" id="BxPlaceName" placeholder="Search Places..." maxlength="25" onkeyup="GetCityRecommendations()"/>
						<img class="LocationIcon" src="Images/icons8-location.gif" width="1" height="1"/>
						<ul class="LocationList" id="LocationList" style="display:none" ></ul>
						<select class="GenderDD">
							<option selected="selected">Gender</option>
							<option>Male</option>
							<option>Female</option>
							<option>Any</option>
						</select>
					</div>
				</div>
			</div>
			<div class="ListingMainDiv" id="ListingMainDiv"></div>
			<div class="FooterDiv">
				<div class="FooterRow">
					<div class="FooterCol">
						<h2 class="BrandName">Room<span class="GreenSpan">Mate</span><sup class="SupScript">R</sup></h2>
						<p>Unit no. 1227 ,1228, Tower C in Alphathum, Sector 90 Noida - 201305</p>
						<a class="MailAnchor" href="mailto:feedback@Roommate.in">feedback@Roommate.in</a>
						<button onclick="ContactUs()" class="Btn BtnContactUs">Contact Us</button>
					</div>
					<div class="FooterCol">
						<h2>About</h2>
						<ul>
							<li>Company</li>
							<li>Terms & Conditions</li>
							<li>Privacy Policy</li>
							<li>Refund & Cancel</li>
							<li>Careers</li>
							<li>Blogs</li>
						</ul>
					</div>
					<div class="FooterCol">
						<h2>Roommates</h2>
						<ul>
							<li>Roommates in Delhi</li>
							<li>Roommates in Noida</li>
							<li>Roommates in Gurgaon</li>
							<li>Roommates in Bangalore</li>
							<li>Roommates in Pune</li>
							<li>Roommates in Hyderabad</li>
						</ul>
					</div>
					<div class="FooterCol">
						<h2>PGs</h2>
						<ul>
							<li>PG in Delhi</li>
							<li>PG in Noida</li>
							<li>PG in Gurgaon</li>
							<li>PG in Bangalore</li>
							<li>PG in Pune</li>
							<li>PG in Hyderabad</li>
						</ul>
					</div>
					<div class="FooterCol">
						<h2>Our Services</h2>
						<ul>
							<li>Rental Agreement</li>
							<li>Furniture On Rent</li>
							<li>Rent Receipt</li>
							<li>Manage Your Room</li>
							<li>Zero Deposit</li>
						</ul>
					</div>
				</div>
				<div class="FooterBottom">
					<label>Product of Munchem India Pvt.Ltd</label>
					<button onclick="UsefulLinks()" class="BtnUseFulLinks">Useful Links</button>
					<label>© 2023 Munchem.com All Rights Reserved</label>
				</div>
			</div>
        </div>
		<div id="Container" class="MsgContainer" style="display:none">
			<p id="messageP"></p>
			<div>
				<input type="button" value="LOGIN" onclick="SignIn()" id="BtnOK" class="BtnOK" />
				<input type="button" value="Skip" onclick="SkipLogin()" id="BtnOK" class="BtnOK" />
			</div>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script>
			$(document).ready(function () {
				checkSession();
				CheckLocalStorage();
			});
			const ReidrectToSignUp = document.querySelector("#SignUpRedirect");
			const ReidrectToSignIn = document.querySelector("#SignInRedirect");
			ReidrectToSignIn.addEventListener("click", function (e) {
				window.location.href = "UserLogin.aspx";
			});
			ReidrectToSignUp.addEventListener("click", function (e) {
				window.location.href = "UserRegistration.aspx";
			});
			function NavToAddListing() {
				window.location.href = "AddListingPage.aspx";
			}
			function ProfileOptions() {
                let DD = document.getElementById("profileDD");
                DD.classList.toggle("show");
            }
            window.onclick = function (e) {
                if (!e.target.matches('.ProfileLogo')) {
                var myDropdown = document.getElementById("profileDD");
                    if (myDropdown.classList.contains('show')) {
                        myDropdown.classList.remove('show');
                    }
                }
			}
			function SignIn() {
				window.location.href = "UserLogin.aspx";
			}
			function SignUp() {
				window.location.href = "UserRegistration.aspx";
			}
			function NavToAddListing() {
				window.location.href = "AddListingPage.aspx";
			}
			function SkipLogin() {
				$("#messageP").text("");
				$("#Container").css("display", "none");
				$(".HomeHeaderDiv").css("pointer-events", "auto");
				$("#ListingMainDiv").css("pointer-events", "auto");
				$(".FooterDiv").css("pointer-events", "auto");
			}
			function OpenMobNavBar() {
				if ($("#OpenedMobNavBar").css("display") == "flex") {
					$("#OpenedMobNavBar").css("display", "none");
				}
				else {
					$("#OpenedMobNavBar").css("display", "flex");
				}
			
			}
			function LogOut() {
				$.ajax({
					type: "POST",
					url: "HomePage.aspx/LogOut",
					dataType: "json",
					contentType: "application/json",
					success: function (msg) {
						if (msg.d != null) {
							if (msg.d.length > 0) {
								if (msg.d == "cleared") {
									window.location.href = "UserLogin.aspx";
								}
							}
						}
					}
				});
			}
			function checkSession() {
				$.ajax({
					type: "POST",
					url: "HomePage.aspx/GetSessionValues",
					dataType: "json",
					contentType: "application/json",
					success: function (msg) {
						if (msg.d != null) {
							if (msg.d.length > 0) {
								if (msg.d != "Session Expired") {
									$("#NormalHomePage").css("display", "none");
									$("#LoggedInDiv").css("display", "flex");
									$("#profileDD").append("<li onclick='Profile'>"+msg.d+"</li>");
									$("#profileDD").append("<li onclick='LogOut()'>Log Out</li>");

								}
								else {
									$("#NormalHomePage").css("display", "flex");
									$("#LoggedInDiv").css("display", "none");
								}
							}
						}
					}
				});
			}
			function GetCityRecommendations() {
				let hint = document.getElementById("BxPlaceName").value;
				if (hint == "") {
					$("#LocationList").css("display", "none");
				}
				else {
					$.ajax({
						type: "POST",
						url: "AddListingPage.aspx/GetCityRecommendations",
						data: "{'hint':'" + hint + "'}",
						dataType: "json",
						contentType: "application/json",
						success: function (msg) {
							if (msg.d != null) {
								if (msg.d.length > 0) {
									let li = "";
									for (let i = 0; i < msg.d.length; i++) {
										li += "<li id=" + msg.d[i].city_id + " onclick='SelectedCity(this)'>" + msg.d[i].city + ", " + msg.d[i].state + "</li>";
									}
									$("#LocationList").html(li);
									$("#LocationList").css("display","");
								}
							}
						}
					});				
				}
			}
			function SelectedCity(e) {
				$("#BxPlaceName").val(e.innerText);
				$("#LocationList").css("display", "none");
				GetPropertiesByCityId(e.id);
			}
			function GetProperties() {
				$.ajax({
					type: "POST",
					url: "PropertyListingPage.aspx/GetProperties",
					dataType: "json",
					contentType: "application/json",
					success: function(lst) {
						if (lst.d != null) {
							if (lst.d.length > 0) {
								let ProItem = "";
								for (let i = 0; i < lst.d.length; i++) {
									ProItem += "<div class='ProItem' onclick='ViewProperty(this)' id="+lst.d[i].property_id+">\
													<div class='ProitemOne'>\
														<div><img src='Images/DPImg.jpeg' /></div>\
														<div class='PIOInnerDiv'>\
															<h3>"+lst.d[i].owner_name+"</h3>\
															<label>"+lst.d[i].location+"</label>\
															<div><p>Rent<br /><b>₹ "+lst.d[i].appro_rent+"</b></p><p>Looking for<br /><b>"+lst.d[i].looking_for+"</b></p><p>Occupancy<br /><b>"+lst.d[i].occupancy+"</b></p></div>\
														</div>\
													</div>\
													<div class='ProitemTwo'>\
														<label>0 km from your search</label><label>100% match</label>\
													</div>\
												</div>";
								}
								$("#ListingMainDiv").html(ProItem);
							}
						}
					}
				});
			}
			function CheckLocalStorage() {
				let city_id = localStorage.getItem("city_id");
				if (city_id != null) {
					GetPropertiesByCityId(city_id);
					localStorage.clear();
				}
				else {
					GetProperties();
				}
			}
			function GetPropertiesByCityId(city_id) {
				$.ajax({
					type: "POST",
					url: "PropertyListingPage.aspx/GetPropertiesByCityId",
					data: "{'city_id':'" + city_id + "'}",
					dataType: "json",
					contentType: "application/json",
					success: function (lst) {
						if (lst.d != null) {
							if (lst.d.length > 0) {
								let ProItem = "";
								for (let i = 0; i < lst.d.length; i++) {
									ProItem += "<div class='ProItem' onclick='ViewProperty(this)' id=" + lst.d[i].property_id + ">\
													<div class='ProitemOne'>\
														<div><img src='Images/DPImg.jpeg' /></div>\
														<div class='PIOInnerDiv'>\
															<h3>"+ lst.d[i].owner_name + "</h3>\
															<label>"+ lst.d[i].location + "</label>\
															<div><p>Rent<br /><b>₹ "+ lst.d[i].appro_rent + "</b></p><p>Looking for<br /><b>" + lst.d[i].looking_for + "</b></p><p>Occupancy<br /><b>" + lst.d[i].occupancy + "</b></p></div>\
														</div>\
													</div>\
													<div class='ProitemTwo'>\
														<label>0 km from your search</label><label>100% match</label>\
													</div>\
												</div>";
									$("#CityName").text(lst.d[i].location);
								}
								$("#ListingMainDiv").html(ProItem);

							}
						}
					}
				});
			}
			function SignIn() {
				window.location.href = "UserLogin.aspx";
			}
			function SignUp() {
				window.location.href = "UserRegistrtion.aspx";
			}
			function ViewProperty(e) {
				$.ajax({
					type: "POST",
					url: "HomePage.aspx/GetSessionValues",
					dataType: "json",
					contentType: "application/json",
					success: function (msg) {
						if (msg.d != null) {
							if (msg.d.length > 0) {
								if (msg.d == "Session Expired") {
									$("#messageP").text("In order to view property you have to login.");
									$("#Container").css("display", "flex");
									$(".HomeHeaderDiv").css("pointer-events", "none");
									$("#ListingMainDiv").css("pointer-events", "none");
									$(".FooterDiv").css("pointer-events", "none");
								}
								else {
									localStorage.setItem("PropertyId", e.id);
									window.location.href = "PropertyViewPage.aspx";
								}
							}
						}
					}
				});				
			}
		</script>
    </form>
</body>
</html>

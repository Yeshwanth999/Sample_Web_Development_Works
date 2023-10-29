<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="RoomMateWebsite.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RoomMate.in</title>
	<link rel="stylesheet" href="StyleSheets/StyleSheet1.css"/>
	<link rel="stylesheet" href="StyleSheets/StyleSheet2.css"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">
		<div class="Window">
			<div class="HomeMain">
				<div class="HomeHeaderDiv">
					<div>
						<div class="BrandNameDiv"><h3 class="BrandName">Room<span class="GreenSpan">Mate</span><sup class="SupScript">R</sup></h3></div>
						<div id="NormalHomePage" class="HomeHeaderDivRight" >
							<input type="button" class="BtnHomeSignIn" id="SignInRedirect" value="Sign in" onclick="SignIn()" />
							<input type="button" class="BtnHomeSignUp" id="SignUpRedirect" value="Sign Up" onclick="SignUp()" />
						</div>
						<div id="LoggedInDiv" class="LoggedInDiv" style="display:none;">
							<input type="button" class="BtnMyTeam" id="BtnMyTeam" value="My Team" onclick="MyTeam()" />
							<input type="button" class="BtnAddListing" id="BtnAddListing" value="+ Add Listing" onclick="NavToAddListing()" />
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
				</div>
				<div class="HomeBodyDiv">
					<div class="HomeBodyOne">
						<div class="HomeBodyOneLeft">
							<p class="p1"><b>Find <span class="GreenSpan">Like-Minded</span> Roommates & PGs</b></p>
							<p class="p2">Share your room with right roommates</p>
							<div>
								<input type="text" class="Box BxPlaceName" id="BxPlaceName" placeholder="Search Places..." maxlength="25" onkeyup="GetCityRecommendations()"/>
								<img class="LocationIcon" src="Images/icons8-location.gif" width="1" height="1"/>
								<ul class="LocationList" id="LocationList" style="display:none" ></ul>
							</div>
							<label>Top Cities: <a href="PropertyListingPage.aspx" id="3121a0d3-ba28-49b8-b410-a17f6c1e4c2b" onclick="ViewProps(this)">Banglore</a>, <a href="PropertyListingPage.aspx" id="ca191eb4-82e2-4cb6-9453-053475e8da78" onclick="ViewProps(this)">Hyderabd</a>, <a href="PropertyListingPage.aspx" id="242849ff-7538-4cda-aa15-82fd78bfb08c" onclick="ViewProps(this)">Pune</a>, <a href="PropertyListingPage.aspx">View More</a></label>
						</div>
						<div class="HomeBodyOneRight">
							<img class="HomeBodyTopImg" src="Images/home-image.jpeg" />
						</div>
					</div>
					<div class="HomeBodyTwo">
						<p class="p1"><b>View rooms in <span class="GreenSpan">Popular Cities</span></b></p>
						<div class="CitierGrid" id="CitierGrid"></div>
					</div>
					<div class="HomeBodyThree">
						<div class="HomeBodyOneLeft">
							<p class="p1"><b>Are you looking for <span class="GreenSpan">Premium Properties?</span></b></p>
							<p class="p2">View and book your appointment with our partners</p>
							<input type="button" class="BtnMyTeam" value="View Properties" onclick="ViewProperties()" />
						</div>
						<div class="HomeBodyOneRight">
							<img class="PremiumProperty1" src="Images/premium-property.jpeg" />
							<img class="PremiumProperty2" src="Images/premium-property1.jpeg" />
						</div>
					</div>
					<div class="HomeBodyFour">
						<div class="HomeBodyOneLeft">
							<p class="p1"><b>Getting <span class="GreenSpan">Rental Agreement</span> made easy, quick and affordable</b></p>
							<p class="p2">View and book your appointment with our partners</p>
							<input type="button" class="BtnMyTeam" value="Create Rent Agreement" onclick="ViewProperties()" />
						</div>
						<div class="HomeBodyOneRight">
							<img class="" src="Images/rent-agreement.svg" />
						</div>
					</div>
					<div class="HomeBodyFive">
						<div class="HomeBodyOneLeft">
							<p class="p1"><b>Don't want to pay <span class="GreenSpan">security deposit?</span></b></p>
							<p class="p2">Now, with rental bond, your peace of mind is guaranteed!</p>
							<input type="button" class="BtnMyTeam" value="Apply Now" onclick="ViewProperties()" />
						</div>
						<div class="HomeBodyOneRight">
							<img src="Images/HomeBodyFiveImg.svg" />
						</div>
					</div>
					<div class="HomeBodySix">
						<div class="HomeBodyOneLeft">
							<p class="p1"><b><span class="GreenSpan">Connect with us</span> from anywhere</b></p>
							<p class="p2">Download the mobile app and enjoy the smoothest experience</p>
						</div>
						<div class="HomeBodyOneRight">
							<img src="Images/flamate-app-image.jpeg" />
						</div>
					</div>
				</div>
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
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script>
			$(document).ready(function () {
				checkSession();
				GetCities();
			});
			function SignIn() {
				window.location.href = "UserLogin.aspx";
			}
			function SignUp() {
				window.location.href = "UserRegistration.aspx";
			}
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
			const ReidrectToSignUp = document.querySelector("#SignUpRedirect");
			const ReidrectToSignIn = document.querySelector("#SignInRedirect");
			ReidrectToSignIn.addEventListener("click", function (e) {
				window.location.href = "UserLogin.aspx";
			});
			ReidrectToSignUp.addEventListener("click", function (e) {
				window.location.href = "UserRegistration.aspx";
			});
			function GetCities() {
				$.ajax({
					type: "POST",
					url: "HomePage.aspx/GetCities",
					dataType: "json",
					contentType: "application/json",
					success: function (msg) {
						if (msg.d != null) {
							if (msg.d.length > 0) {
								let GridItem = "";
								for (let i = 0; i < msg.d.length; i++) {
									GridItem += "<div class='GridItem' id='"+msg.d[i].city_id+"' onclick='ViewProps(this)'><span><img class='gridImg' src='Images/"+msg.d[i].city.toLowerCase()+".jpeg' /></span><label>"+msg.d[i].city+"</label></div>";
								}
								$("#CitierGrid").html(GridItem);
							}
						}
					}
				});
			}
			function OpenMobNavBar() {
				if ($("#OpenedMobNavBar").css("display") == "flex") {
					$("#OpenedMobNavBar").css("display", "none");
				}
				else {
					$("#OpenedMobNavBar").css("display", "flex");
				}
			
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
				let city_id = e.id;
				localStorage.setItem("city_id", city_id);
				window.location.href = "PropertyListingPage.aspx";
			}
			function ViewProps(e) {
				let city_id = e.id;
				localStorage.setItem("city_id", city_id);
				window.location.href = "PropertyListingPage.aspx";
			}


			
			
		</script>
    </form>
</body>
</html>

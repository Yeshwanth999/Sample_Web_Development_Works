<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PropertyViewPage.aspx.cs" Inherits="RoomMateWebsite.PropertyViewPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Property View</title>
	<link rel="stylesheet" href="StyleSheets/StyleSheet1.css"/>
	<link rel="stylesheet" href="StyleSheets/StyleSheet2.css"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="HomeMain">
			<div class="HomeHeaderDiv">
				<div>
					<div><h3 class="BrandName">Room<span class="GreenSpan">Mate</span><sup class="SupScript">R</sup></h3></div>
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
				</div>
				<span class="NavBar"><a id="NavHome" href="HomePage.aspx">Home</a> / <a href="PropertyListingPage.aspx">Property</a> / <a id="OwnerNameAnchor" href=""></a></span>
			</div>
			<div class="PropertyViewMainDiv" id="PropertyViewMainDiv">
				<div class="PropertyViewLeft">
					<div>
						<img src="Images/DPImg.jpeg" class="OwnerDP" />
						<h3 id="OwnerName"></h3>
						<input type="button" value="chat" class="BtnContactUs BtnChat" id="BtnChat" />
					</div>
				</div>
				<div class="PropertyViewRight">
					<div class="PropertyViewRightLocation">
						<h3>Location</h3>
						<label id="location">Basheer Bagh, Hyderabad</label>
					</div>
					<div class="PropertyViewRightBasicInfo">
						<h3>Basic Info</h3>
						<div><p>Rent<br /><b>₹ <span id="rent"></span></b></p><p>Looking for<br /><b><span id="lookingfor"></span></b></p><p>Occupancy<br /><b><span id="occupancy"></span></b></p></div>
					</div>
					<div class="PropertyViewRighPictures">
						<h3>Pictures</h3>
						<div>
							<img class="PropertyDP" src="Images/PropertyDP1.jpeg" id="PropertyDP1" />
							<img class="PropertyDP" src="Images/PropertyDP2.jpeg" id="PropertyDP2" />
							<img class="PropertyDP" src="Images/PropertyDP3.jpeg" id="PropertyDP3" />

						</div>
					</div>
					<div class="PropertyViewRightPreferences">
						<h3>Preferences</h3>
						<div class="PrefGrid" id="PrefGrid"></div>
					</div>
					<div class="PropertyViewRightAmenities">
						<h3>Amenities</h3>
						<div class="AmenitiesGrid" id="AmenitiesGrid"></div>
					</div>
					<div class="PropertyViewRightDescription">
						<h3>Description</h3>
						<p class="PropertyDescription" id="description"></p>
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script>
			$(document).ready(function () {
				CheckLocalStorage();
				checkSession();
			});
			function CheckLocalStorage() {
				let PropertyId = localStorage.getItem("PropertyId");
				if (PropertyId != null) {
					GetPropertyByPropertyId(PropertyId);
				}
				else {
					window.location.href = "PropertyListingPage.aspx";
				}
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
									return true;
								}
								else {
									$("#NormalHomePage").css("display", "flex");
									$("#LoggedInDiv").css("display", "none");
									return false;
								}
							}
						}
					}
				});
			}
			function GetPropertyByPropertyId(PropertyId) {
				let x = PropertyId;
				$.ajax({
					type: "POST",
					url: "PropertyViewPage.aspx/GetPropertyByPropertyId",
					data: "{'property_id':'" + PropertyId + "'}",
					dataType: "json",
					contentType: "application/json",
					success: function (msg) {
						if (msg.d != null) {
							if (msg.d.length > 0) {
								$("#OwnerName").text(msg.d[0]);
								$("#location").text(msg.d[1]);
								$("#rent").text(msg.d[2]);
								$("#lookingfor").text(msg.d[3]);
								$("#occupancy").text(msg.d[4]);
								pref = msg.d[5].split(",");
								for (let i = 0; i < pref.length; i++) {
									$("#PrefGrid").append("<div class='PrefItem'>" + pref[i] + "</div>");
								}
								amenities = msg.d[6].split(",");
								for (let i = 0; i < amenities.length; i++) {
									$("#AmenitiesGrid").append("<div class='AmenitiesItem'>" + amenities[i] + "</div>");
								}
								$("#description").text(msg.d[7]);
							}
						}
					}
				});
			}
		</script>
    </form>
</body>
</html>

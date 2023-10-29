<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddListingPage.aspx.cs" Inherits="RoomMateWebsite.AddListingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Lisitng</title>
	<link rel="stylesheet" href="StyleSheets/StyleSheet1.css"/>
	<link rel="stylesheet" href="StyleSheets/StyleSheet2.css"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">
		<div class="AddListingPageMainDiv">
			<div class="ListingPageHeader"><h3 class="BrandName">Room<span class="GreenSpan">Mate</span><sup class="SupScript">R</sup></h3></div>
			<div class="ListingPageBody">
				<span class="NavBar"><a id="NavHome" href="HomePage.aspx">Home</a> / <a id="NavListing" href="AddListingPage.aspx">Add Listing</a></span>
				<div class="DivNavFLatOptions"><input id="BtnHaveFlat" type="button" value="Have Flat" class="BtnHaveFlat" onclick="HaveFlat()" /><input type="button" id="BtnNeedFlat" value="Need Flat" class="BtnNeedFlat" onclick="NeedFlat()" /></div>
				<div id="DivHaveFlat">
					<h2>Have flat</h2>
					<p>If you are looking for flatmate.</p>
					<div class="ListingBodyOne">
						<div>
							<label>Add your location*</label>
							<input type="text" placeholder="Add Location..." id="BxLocation" class="Box" onkeyup="GetCityRecommendations()" onkeypress="allowAlphaSpace(event)" />
							<ul class="LocationList temp" id="LocationList" style="display:none" ></ul>
						</div>
						<div class="LBORight">
							<label>Looking For</label>
							<ul>
								<li>
									<input type="radio" name="gender" id="male" value="Male" />
									<label for="male" >Male</label>
								</li>
								<li>
									<input type="radio" name="gender" id="female" value="Female"/>
									<label for="female" >Female</label>
								</li>
								<li>
									<input type="radio" name="gender" id="GenderAny" checked="checked" value="Any" />
									<label for="GenderAny" >Any</label>
								</li>
							</ul>
						</div>
					</div>
					<div class="ListingBodyOne">
						<div class="LBOLeft">
							<label>Approx Rent*</label>
							<span class="currencyinput">₹<input type="text" id="BxRent" class="Box" onkeypress="allowNumeric(event)" maxlength="5" /></span>
						</div>
						<div class="LBORight">
							<label>Occupancy</label>
							<ul>
								<li>
									<input type="radio" name="occupancy" id="single" checked="checked" />
									<label for="single" >single</label>
								</li>
								<li>
									<input type="radio" name="occupancy" id="shared" />
									<label for="shared" >shared</label>
								</li>
								<li>
									<input type="radio" name="occupancy" id="OccAny" />
									<label for="OccAny" >Any</label>
								</li>
							</ul>
						</div>
					</div>
					<div class="ListingBodyTwo" id="DivPhotos">
						<label id="lblPhotos">Upload 3 Photos of your flat</label>
						<div>
							<label for="UploadImage" id="IDUploadImage">+</label><input type="file" accept="image/*" style="display:none;" class="UploadImage" id="UploadImage"/>
							<div id="displayImages" style="display:none">
							</div>
						</div>
						
					</div>
					<div class="ListingBodyOne" id="DivInts">
						<div class="LBORight">
							<label>Are you intrested in PG too?</label>
							<ul>
								<li>
									<input type="radio" name="IntInPg" id="PGYes" checked="checked" />
									<label for="PGYes" >Yes</label>
								</li>
								<li>
									<input type="radio" name="IntInPg" id="PGNo" />
									<label for="PGNo" >No</label>
								</li>
							</ul>
						</div>
						<div class="LBORight">
							<label>Are you intrested in making <span class="GreenSpan">Teams?</span></label>
							<ul>
								<li>
									<input type="radio" name="IntInTeams" id="TeamsnYes" checked="checked" />
									<label for="TeamsnYes" >Yes</label>
								</li>
								<li>
									<input type="radio" name="IntInTeams" id="TeamsNo" />
									<label for="TeamsNo" >No</label>
								</li>
							</ul>
						</div>
					</div>
					<div class="ListingBodyOne">
						<div>
							<label>Contact Number*</label>
							<input type="text" placeholder="9999 999 999" id="BxContactNumber" class="Box" disabled="disabled" />
						</div>
						<div class="LBOLeft">
							<label>Available From*</label>
							<input type="date" id="BxDate" class="Box" />
						</div>
					</div>
					<div class="ListingBodyThree" id="DivAmenities">
						<label>Amenities</label>
						<div class="AmenitiesGrid">
							<div class="AmenitiesItem">TV</div>
							<div class="AmenitiesItem">Fridge</div>
							<div class="AmenitiesItem">Kitchen</div>
							<div class="AmenitiesItem">Wifi</div>
							<div class="AmenitiesItem">Machine</div>
							<div class="AmenitiesItem">AC</div>
							<div class="AmenitiesItem">Power Backup</div>
							<div class="AmenitiesItem">Cook</div>
							<div class="AmenitiesItem">Parking</div>
						</div>
					</div>
					<div class="ListingBodyTwo">
						<label>Description*</label>
						<textarea id="BxDescription" rows="4" cols="100"></textarea>
					</div>
					<div class="SubmitDiv">
						<input type="button" class="BtnSignIn" id="BtnSubmit" onclick="AddListing()" value="Submit" />
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
				HaveFlat();
				GetUserByUserId();
			});
			var X = $(".AmenitiesItem")
			for (let i = 0; i < X.length; i++) {
				X[i].addEventListener("click", SelectPreference, false);
			}
			function allowAlphaSpace(e) {
                var code = ('charCode' in e) ? e.charCode : e.keyCode;
                if (!(code == 32) && // space
                !(code > 64 && code < 91) && // upper alpha (A-Z)
                !(code > 96 && code < 123)) { // lower alpha (a-z)
                e.preventDefault();
                }
            }
            function allowNumeric(e) {
                var code = ('charCode' in e) ? e.charCode : e.keyCode;
                if (!(code > 47 && code < 58)) { // numeric (0-9)
                e.preventDefault();
                }
            }
			function SelectPreference(e) {
				if (e.currentTarget.style.backgroundColor != "rgb(21, 179, 106)") {
					e.currentTarget.style.backgroundColor = "#15b36a";
					e.currentTarget.style.color = "white";
				}
				else {
					e.currentTarget.style.backgroundColor = "#f3f4f6";
					e.currentTarget.style.color = "#959595";
				}
			}
			function HaveFlat() {
				$("#DivInts").css("display", "none");
				$("#DivPhotos").css("display", "");
				$("#BtnHaveFlat").css("background-color", "rgb(21, 179, 106)");
				$("#BtnNeedFlat").css("background-color", "#e5e5e5");
				$("#BtnHaveFlat").css("color", "white");
				$("#BtnNeedFlat").css("color", "#959595");
			}
			function NeedFlat() {
				$("#DivPhotos").css("display", "none");
				$("#DivInts").css("display", "");
				$("#BtnHaveFlat").css("background-color", "#e5e5e5");
				$("#BtnNeedFlat").css("background-color", "rgb(21, 179, 106)");
				$("#BtnHaveFlat").css("color", "#959595");
				$("#BtnNeedFlat").css("color", "white");
				$("#DivAmenities").css("display","none")
			}
			const input = document.getElementById("UploadImage");
			const imgfile = input.files;
			let imgFiles = "";
            input.addEventListener("change", function () {
                displayImage(this);
            })
			function displayImage(input) { 
                var reader;
                if (input.files && input.files[0]) {
                    reader = new FileReader();
					reader.onload = function (e) {
						let img = "<img src='" + e.target.result + "' class='UploadedImage' width='100' height='100' />";
						document.getElementById("displayImages").innerHTML += img;
                    }
					reader.readAsDataURL(input.files[0]);
					imgFiles += input.files[0].name+", ";
                    document.getElementById("displayImages").style.display = "block";
                }
			}
			function GetCityRecommendations() {
				let hint = document.getElementById("BxLocation").value;
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
				$("#BxLocation").val(e.innerText);
				$("#LocationList").css("display", "none");
			}
			function GetUserByUserId() {
				$.ajax({
					type: "POST",
					url: "AddListingPage.aspx/GetUserPhoneByUserId",
					dataType: "json",
					contentType: "application/json",
					success: function (msg) {
						if (msg.d != null) {
							if (msg.d.length > 0) {
								$("#BxContactNumber").val(msg.d);
							}
						}
					}
				});
			}
			function AddListing() {
				let x = $("#LocationList li");
				let city_id = x[0].id;
				let location = $("#BxLocation").val();
				if (location == "") {
					alert("Please add your location");
					return false;
				}
				let appro_rent = $("#BxRent").val();
				if (appro_rent == "") {
					alert("Please enter approxi rent");
					return false;
				}
				let looking_for = "";
				if ($("#male").is(":checked")) {
					looking_for = "Male";
				}
				else if ($("#female").is(":checked")) {
					looking_for = "Female";
				}
				else {
					looking_for = "Any";
				}
				let occupancy = "";
				if ($("#single").is(":checked")) {
					occupancy = "Single";
				}
				else if ($("#shared").is(":checked")) {
					occupancy = "Shared";
				}
				else {
					occupancy = "Any";
				}
				let pictures = imgFiles;
				if (pictures.length > 4) {
					pictures = pictures.substring(0, pictures.length - 2);
					let a = pictures.split(",");
					if (a.length < 3) {
						alert("Please upload 3 Photos of your flat");
						return false;
					}
					
				}
				else {
					alert("Please upload 3 Photos of your flat");
					return false;
				}
				let y = $(".AmenitiesItem");
				let amenities = "";
				for (let i = 0; i < y.length; i++) {
					if (y[i].style.backgroundColor == "rgb(21, 179, 106)") {
						amenities += y[i].innerText + ",";
					}
				}
				amenities = amenities.substring(0, amenities.length - 1);
				let available_from = $("#BxDate").val();
				if (available_from.length == "") {
					alert("Select a date from which flat is available for rent");
					return false;
				}
				let description = $("#BxDescription").val();
				$.ajax({
					type: "POST",
					url: "AddListingPage.aspx/AddListing",
					data: "{'city_id':'" + city_id + "','location':'" + location + "','appro_rent':'" + appro_rent + "','occupancy':'" + occupancy + "','looking_for':'" + looking_for + "','pictures':'" + pictures + "','amenities':'" + amenities + "','description':'" + description + "', 'available_from':'" + available_from + "'}",
					dataType: "json",
					contentType: "application/json",
					success: function (msg) {
						if (msg.d != null) {
							if (msg.d.length > 0) {
								alert(msg.d);
								window.location.reload();
							}
						}
					}
				});
			}

            
		</script>
    </form>
</body>
</html>

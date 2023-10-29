<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="RoomMateWebsite.UserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RoomMate Login</title>
	<link rel="stylesheet" href="StyleSheets/StyleSheet1.css"/>
	<link rel="stylesheet" href="StyleSheets/StyleSheet2.css"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="MainDiv">
            <div class="MainDivLeft">
				<figure>
					<img src="Images/LoginPageImg.jpeg" class="Img ImgLogin" />
				</figure>
            </div>
            <div class="MainDivRight">
				<div>
					<span id="CrossBtn" class="NavLinks BtnClose">X</span>
					<div class="LoginForm">
						<h2 class="BrandName">Room<span class="GreenSpan">Mate</span><sup class="SupScript">R</sup></h2>
						<div>
							<h3>Sign In To Account</h3>
							<span class="SpamSpan"></span>
							<div><h4 class="FaceBookIcon Btn">f</h4><img class="icon GoogleLogo Btn" src="Images/GoogleLogo.jpeg" /></div>
							<p>or use your mobile number</p>
							<div class="PhoneNoDiv"><img src="Images/PhoneIcon.png"class="icon PhoneIcon" /><input type="text" id="BxPhoneNo" class="Box BoxPhoneNo" placeholder="9999 999 999" value="" maxlength="10"/></div>
							<div><input type="password" class="Box BoxPassword" id="BxPassword" placeholder="Password" maxlength="25"/>
							<i class="far fa-eye-slash" id="togglePassword" style="margin-left: -30px; cursor: pointer;"></i></div>							
							<input type="button" value="Sign In" onclick="SignIn()" class="BtnSignIn" />
							<p>Don't have an account? <span class="GreenSpan NavLinks" id="SignUpRedirect">Sign Up</span></p>
							<p>Having trouble? <span class="GreenSpan NavLinks">Give Feedback</span></p>
						</div>
					</div>
				</div>
            </div>
        </div>
		<div class="FooterDiv">
			<div class="FooterRow">
				<div class="FooterCol">
					<h2 class="BrandName">Room<span class="GreenSpan">Mate</span><sup class="SupScript">R</sup></h2>
					<p>Unit no. 1227 ,1228, Tower C in Alphathum, Sector 90 Noida - 201305</p>
					<a class="MailAnchor" href="mailto:feedback@Roommate.in">feedback@Roommate.in</a>
					<input type="button" onclick="ContactUs()" class="Btn BtnContactUs" value="Contact Us" />
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script>
			$(document).ready(function () {
                       
			});
			function SignIn() {
				let phone = $("#BxPhoneNo").val();
				let pswd = $("#BxPassword").val();
				if (phone.length !=10) {
                    alert("Please enter valid mobile number");
                    return false;
				}
				if (pswd.length == 0)
                {
                    alert("Password cannot be empty");
                    return false;
				}
				$.ajax({
					type: "POST",
					url: "UserLogin.aspx/SignIn",
					data: "{'phone':'" + phone + "','password':'" + pswd + "'}",
					dataType: "json",
					contentType: "application/json",
					success: function (msg) {
						if (msg.d != null) {
							if (msg.d.length > 0) {
								alert(msg.d);
							}
							else {
								window.location.href = "HomePage.aspx";
							}
						}
					}
				});
			}
			function allowNumeric(e) {
                var code = ('charCode' in e) ? e.charCode : e.keyCode;
                if (!(code > 47 && code < 58)) { // numeric (0-9)
                e.preventDefault();
                }
			}
			const togglePassword = document.querySelector('#togglePassword');
            const password = document.querySelector('#BxPassword');
            togglePassword.addEventListener('click', function (e) {
                // toggle the type attribute
                let type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                // toggle the eye slash icon
                if (this.classList.value == "far fa-eye-slash") {
                    this.classList.value = "far fa-eye";
                }
                else {
                    this.classList.value = "far fa-eye-slash";
                }

			});
			const ReidrectToSignUp = document.querySelector("#SignUpRedirect");
			const RedirectToHome = document.querySelector("#CrossBtn");
			ReidrectToSignUp.addEventListener("click", function (e) {
				window.location.href = "UserRegistration.aspx";
			});
			RedirectToHome.addEventListener("click", function (e) {
				window.location.href = "HomePage.aspx";
			});
		</script>
    </form>
</body>
</html>

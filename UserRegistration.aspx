<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="RoomMateWebsite.UserRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RoomMate Registration</title>
	<link rel="stylesheet" href="StyleSheets/StyleSheet1.css"/>
	<link rel="stylesheet" href="StyleSheets/StyleSheet2.css"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="MainDiv RegPageMainDiv" id="RegPageMainDiv">
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
							<h3>Sign Up</h3>
							<p>to continue with RoomMate.in</p>
							<input type="text" class="Box" id="BxFullName" placeholder="Full Name" maxlength="40" onkeypress="allowAlphaSpace(event)"/>
							<input type="text" class="Box" id="BxEmail" placeholder="E-mail" maxlength="50"/>
							<div class="PhoneNoDiv"><img src="Images/PhoneIcon.png"class="icon PhoneIcon" /><input type="text" class="Box BoxPhoneNo" id="BxPhoneNo" placeholder="9999 999 999" value="" maxlength="10" onkeypress="allowNumeric(event)"/></div>
							<div><input type="password" class="Box BxPassword" id="BxPassword" placeholder="Password" maxlength="25"/>
							<i class="far fa-eye-slash" id="togglePassword" style="margin-left: -30px; cursor: pointer;"></i></div>
							<div><input type="password" class="Box BxCnfmPassword" id="BxCnfmPassword" placeholder="Confirm Password" maxlength="25"/>
							<i class="far fa-eye-slash" id="toggleCnfmPassword" style="margin-left: -30px; cursor: pointer;"></i></div>
							<input type="button" onclick="SignUp()" class="Btn BtnSignIn" value="Sign Up" />
							<p>Don't have an account? <span class="GreenSpan NavLinks" id="SignInRedirect">Sign In</span></p>
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
		<div class="MsgContainer" id="MsgContainer" style="display:none">
			<p id="messageP"></p>
			<input type="button" value="OK" onclick="CloseMsgContainer()" id="BtnOK" class="BtnOK" />
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script>
			$(document).ready(function () {
                       
			});
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
			const toggleCnfmPassword = document.querySelector('#toggleCnfmPassword');
            const Cnfmpassword = document.querySelector('#BxCnfmPassword');
            toggleCnfmPassword.addEventListener('click', function (e) {
                // toggle the type attribute
                let type = Cnfmpassword.getAttribute('type') === 'password' ? 'text' : 'password';
                Cnfmpassword.setAttribute('type', type);
                // toggle the eye slash icon
                if (this.classList.value == "far fa-eye-slash") {
                    this.classList.value = "far fa-eye";
                }
                else {
                    this.classList.value = "far fa-eye-slash";
                }
			});
			const ReidrectToSignIn = document.querySelector("#SignInRedirect");
			const RedirectToHome = document.querySelector("#CrossBtn");
			ReidrectToSignIn.addEventListener("click", function (e) {
				window.location.href = "UserLogin.aspx";
			});
			RedirectToHome.addEventListener("click", function (e) {
				window.location.href = "HomePage.aspx";
			});
			function SignUp() {
				let fullname = $("#BxFullName").val();
				let email = $("#BxEmail").val();
				let phone = $("#BxPhoneNo").val();
				let pswd = $("#BxPassword").val();
				let CnfmPswd = $("#BxCnfmPassword").val();
				if (fullname.length < 3) {
                    alert("Name is too short");
                    return false;
				}
				let mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (!(email.match(mailformat))) {
                    alert("Please enter a valid Email Address");
                    return false;
				}
				if (phone.length !=10) {
                    alert("Please enter valid mobile number");
                    return false;
				}
				if ((pswd !== CnfmPswd) || (pswd.length == 0 || CnfmPswd.length == 0))
                {
                    alert("Passwords did not match or passwords are empty");
                    return false;
				}
				$.ajax({
					type: "POST",
					url: "UserRegistration.aspx/SignUp",
					data: "{'fullname':'" + fullname + "','email':'" + email + "','phone':'" + phone + "','pswd':'" + pswd + "'}",
					dataType: "json",
					contentType: "application/json",
					success: function (msg) {
						if (msg.d != null) {
							if (msg.d.length > 0) {
								$("#messageP").text(msg.d);
								$("#MsgContainer").css("display", "flex");
								$("#RegPageMainDiv").css("pointer-events", "none");
							}
						}
					}
				});
			}
			function CloseMsgContainer() {
				let msg = document.getElementById("messageP").innerText;
				if (msg == "Registration successful") {
					$("#MsgContainer").css("display", "none");
					window.location.href = "PreferencePage.aspx";
				}
				else {
					$("#MsgContainer").css("display", "none");
					$("#RegPageMainDiv").css("pointer-events", "");
				}
				
			}
		</script>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreferencePage.aspx.cs" Inherits="RoomMateWebsite.PreferencePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Preference</title>
	<link rel="stylesheet" href="StyleSheets/StyleSheet1.css"/>
	<link rel="stylesheet" href="StyleSheets/StyleSheet2.css"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">
		<div class="PrefMainDiv">
			<div><h3 class="BrandName">Room<span class="GreenSpan">Mate</span><sup class="SupScript">R</sup></h3></div>
			<div class="PrefDiv">
				<h3>What type of flatmate do you like?</h3>
				<p>Select at least 5 preferences</p>
				<div class="PrefGrid">
					<div class="PrefItem">Night Owl</div>
					<div class="PrefItem">Early Bird</div>
					<div class="PrefItem">Studious</div>
					<div class="PrefItem">Fitnes Freak</div>
					<div class="PrefItem">Sporty</div>
					<div class="PrefItem">Wanderer</div>
					<div class="PrefItem">Party Lover</div>
					<div class="PrefItem">Pet Lover</div>
					<div class="PrefItem">Vegan</div>
					<div class="PrefItem">Non Alcoholic</div>
					<div class="PrefItem">Music Lover</div>
					<div class="PrefItem">Non Smoker</div>
				</div>
				<input type="button" id="BtnContinue" class="BtnDownLoadApp" value="Continue" onclick="SelectedPreferences()" />
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
			var X = $(".PrefItem")
			for (let i = 0; i < X.length; i++) {
				X[i].addEventListener("click", SelectPreference, false);
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
			function SelectedPreferences() {
				let SCnt = 0;
				let temp = "";
				for (let i = 0; i < X.length; i++) {
					if (X[i].style.backgroundColor == "rgb(21, 179, 106)") {
						SCnt += 1;
						temp+=X[i].innerText + ",";
					}
				}
				if (SCnt < 5) {
					alert("Select at least 5 preferences");
					return false;
				}
				var prefs = temp.substring(0, temp.length - 1);
				$.ajax({
					type: "POST",
					url: "UserRegistration.aspx/AddPreferences",
					data: "{'preferences':'" + prefs + "'}",
					dataType: "json",
					contentType: "application/json",
					success: function (msg) {
						if (msg.d != null) {
							if (msg.d.length > 0) {
								$("#messageP").text(msg.d + ". Please login to user our services");
								$("#MsgContainer").css("display", "flex");
								$("#PrefMainDiv").css("pointer-events", "none");
							}
						}
					}
				});
			}
			function CloseMsgContainer() {
				$("#MsgContainer").css("display", "none");
				window.location.href = "UserLogin.aspx";
			}
		</script>
    </form>
</body>
</html>

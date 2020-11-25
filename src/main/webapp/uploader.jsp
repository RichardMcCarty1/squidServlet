<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java Ajax Servlet File Upload</title>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/react/15.4.2/react.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/react/15.4.2/react-dom.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.21.1/babel.min.js"></script>
	<script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%--<script type="text/babel">
		class Dashboard extends React.Component {
			onLogoutClick = e => {
				e.preventDefault();
				//this.props.logoutUser();
				//console.log(this.props.auth)

			};

			render() {
				//const { user } = this.props.auth;
				// hello, {user.name.split(" ")[0]}
				return (

						<div>
							<div style={{
								margin: "0",
								position: "absolute",
								top: "45%",
								left: "50%",
								transform: "translate(-50%, -50%)"
							}}>
								<p>Hello world</p>
								<div className="landing-copy col s12 center-align">
									<h2>
										<p className="flow-text grey-text text-darken-1">
											You are logged into SQUID INK.
										</p>
									</h2>
									<button onclick="uploadFile()">Logout</button>
								</div>
							</div>
						</div>
				);
			}
		}
		ReactDOM.render(
				<Dashboard />,
				document.getElementById('root')
		);
	</script>--%>
	<script>
		async function uploadFile() {
			let formData = new FormData();
			formData.append("file", ajaxfile.files[0]);
			await fetch('fileuploadservlet', {
				method: "POST",
				body: formData
			});
			alert('The file upload with Ajax and Java was a success!');
		}

		function hideDropdown(){
			document.getElementById('dropdown-menu').style.display = "none";
		}

		function showDropdown(){
			let element = document.getElementById('dropdown-menu').style.display;
			if (element === "none"){
				document.getElementById('dropdown-menu').style.display = "block";
			}
			else {
				document.getElementById('dropdown-menu').style.display = "none";
			}
		}

		async function getFiles() {
			const data = await fetch('fileuploadservlet', {
				method: "GET",
				body: null
			}).then(function(response) {return response.text();})
					.then(function(data) {
						console.log(data); // this will be a string
						console.log(typeof(data));
						let dataArr = data.split("***");
						console.log(dataArr);
						let file_list = document.getElementById('dropdown-menu');
						file_list.innerHTML = '';
						file_list.innerHTML = file_list.innerHTML + "<form style=\"display: margin: 0; padding: 0;\" class=\"form-horizontal form-validate form-inline\" method=\"post\" action=\"fileuploadservlet\" enctype=\"multipart/form-data\">\n" +
								//"\t\t\t\t\t<button style=\"display:inline;width:120px; height:30px;\" onclick=\"document.getElementById('getFile').click()\">Add File</button>\n" +
								"\t\t\t\t\t<input style=\"display: inline;\" id=\"getFile\" type=\"file\" name=\"file\" />\n" +
								"<button type=\"submit\" onclick=\"hideDropdown()\" style=\"display: inline;\"  value=\"Upload\" class=\"btn btn-primary mb-2\">Submit</button>" +
								//"\t\t\t\t\t<input onclick=\"hideDropdown()\" style=\"display: inline;\" type=\"submit\" value=\"Upload\" />\n" +
								"\t\t\t\t</form>"

						dataArr.forEach(renderProductList);
						showDropdown();
						function renderProductList(element, index, arr) {
							if (element !== ""){

								let li = document.createElement('li');
								li.setAttribute('class', 'item');

								file_list.appendChild(li);

								li.innerHTML = li.innerHTML + "<a href=\"#\">" + element + "<button class=\"btn btn-default btn-xs pull-right remove-item\"><span class=\"glyphicon glyphicon-remove\"/></button> </a>";
							}
						}

					});
			//alert('The file upload with Ajax and Java was a success!');
		}
	</script>
</head>
<body>
	<div class="container" style="min-width: 100%; min-height: 100%">
		<div style="z-index: 10" class="dropdown">
			<button onclick="getFiles()" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">File Manager
				<span class="caret"></span></button>
			<ul id="dropdown-menu" style="display: none;" class="dropdown-menu pre-scrollable">
			</ul>
		</div>
		<div class="fileUpload" style=" border: 2px solid teal; min-width: 80%; min-height: 80%; background-color: lightyellow; display: inline-block; margin: 0; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%)">
			<div class="prawnXML" style="display: inline-block; padding-left: 10%">
				<h4>Zipped Prawn XML File:</h4>
				<form method="post" action="fileuploadservlet" enctype="multipart/form-data">
					<input type="file" name="file" />
					<input type="submit" value="Upload" />
				</form>
			</div>
			<div class="SquidXLS" style="display: inline-block; padding-left: 80px">
				<h4>Squid.* Task XLS File:</h4>
				<form method="post" action="fileuploadservlet" enctype="multipart/form-data">
					<input type="file" name="file" />
					<input type="submit" value="Upload" />
				</form>
			</div>

			<div class="referenceInput" style="padding-left: 10%; padding-top: 5%;">
				<div>
					<form>
						<table>
							<tr>
								<td align="right"><h4 style="display: inline-block">Reference Material Sample Name Filter: </h4></td>
								<td align="left"><input type="text" name="first" /></td>
							</tr>
							<tr>
								<td align="right"><h4 style="display: inline-block">Concentration Reference Material Sample Name Filter: </h4></td>
								<td align="left"><input type="text" name="first" /></td>
							</tr>

						</table>
					</form>
				</div>
			</div>
			<div class="countsAndCalculations" style="padding-top: 5%">
				<div >
					<form>
						<table style="border-collapse: collapse; width: 100%;">
							<tr style="border-bottom: 2px solid teal; border-top: 2px solid teal">
								<td align="right"><h4 style="display: inline-block">Normalize Ion Counts for SBM? </h4></td>
								<td align="left" style="padding-left: 20px">
									<div style="display: list-item; list-style-type: none;">
										<button style="display: inline-block" class="w3-button w3-tiny w3-circle w3-teal">+</button>
										<h6 style="display: inline-block">Yes</h6>
									</div>
									<div style="display: list-item; list-style-type: none;">
										<button style="display: inline-block" class="w3-button w3-tiny w3-circle w3-teal">+</button>
										<h6 style="display: inline-block">No</h6>
									</div>
								</td>
							</tr>
							<tr>
								<td align="right"><h4 style="display: inline-block">Ratio Calculation Method: </h4></td>
								<div>
									<td align="left" style="padding-left: 20px">
										<div style="display: list-item; list-style-type: none;">
											<button style="display: inline-block" class="w3-button w3-tiny w3-circle w3-teal">+</button>
											<h6 style="display: inline-block">Linear regression to burn mid-time</h6>
										</div>
										<div style="display: list-item; list-style-type: none;">
											<button style="display: inline-block" class="w3-button w3-tiny w3-circle w3-teal">+</button>
											<h6 style="display: inline-block">Spot average (time-invariant)</h6>
										</div>
									</td>
								</div>
							</tr>
							<tr style="border-top: 2px solid teal">
								<td align="right"><h4 style="display: inline-block">Preferred Index Isotope: </h4></td>
								<td align="left" style="padding-left: 20px">
									<div style="display: list-item; list-style-type: none;">
										<button style="display: inline-block" class="w3-button w3-tiny w3-circle w3-teal">+</button>
										<h6 style="display: inline-block">204Pb</h6>
									</div>
									<div style="display: list-item; list-style-type: none;">
										<button style="display: inline-block" class="w3-button w3-tiny w3-circle w3-teal">+</button>
										<h6 style="display: inline-block">207Pb</h6>
									</div>
									<div style="display: list-item; list-style-type: none;">
										<button style="display: inline-block" class="w3-button w3-tiny w3-circle w3-teal">+</button>
										<h6 style="display: inline-block">207Pb</h6>
									</div>
								</td>
							</tr>

						</table>
					</form>
				</div>
			</div>
		</div>



		<div id="root"></div>
	</div>

	
</body>
</html>



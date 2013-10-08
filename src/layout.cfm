<cfoutput>
	<cfscript>
		loc = getLobotSettings();
	</cfscript>
</cfoutput>

<!DOCTYPE html>
	<head>
		<meta charset="utf-8">
		<title><cfoutput>#capitalize(loc.plugin.name)# #loc.plugin.version#</cfoutput></title>
		
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/js/bootstrap.min.js"></script>
		
		<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/css/bootstrap.min.css" rel="stylesheet">
		
		<cfinclude template="styles.cfm">
	</head>
	
	<body>
		<cfoutput>
			<div class="container"> 
				<div class="hero-unit">
					<h1>#capitalize(loc.plugin.name)# #loc.plugin.version#</h1>
					<p>Lobot is a [key] obfuscator plugin for ColdFusion on Wheels. This plugin offer a more secure solution to protect your application by obfuscating the [key]. The plugin create a hash of the [key] which is then encrypted with the [key] itself. On each request, the [key] is decrypted and compared to the hash value. If the comparison fails the action is aborted, otherwise the decrypted [key] is restored in the params struct.</p>
					<h2>Benefits of using this plugin:</h2>
					<ul class="small">
						<li>The [key] is encrypted along with the hash value for comparison</li>
						<li>If the comparison is successfull: The [key] is restored in the params struct</li>
						<li>If the comparison fails: The action is aborted</li>
						<li>The obfuscated [key] is impossible to guest and tampering with it will abort the action</li>
						<li>Based on "How to protect sensitive data in URL's" (#linkTo(text="https://www.owasp.org/index.php/How_to_protect_sensitive_data_in_URL%27s", href="https://www.owasp.org/index.php/How_to_protect_sensitive_data_in_URL%27s", target="_blank")#)</li>
					</ul>
				</div>

				<div class="row">
					<div class="span12">
						<h1>Plugin usage</h1>

						<ul class="nav nav-tabs" id="maintabs">
							<li class="active"><a href="##Settings" data-toggle="tab">Settings</a></li>
							<li><a href="##Log" data-toggle="tab">Change Log</a></li>
							<li><a href="##Credits" data-toggle="tab">Credits</a></li>
						</ul>

						<div class="tab-content" id="maincontent">
							<cfinclude template="tabs/settings.cfm">
							<cfinclude template="tabs/log.cfm">
							<cfinclude template="tabs/credits.cfm">
						</div>
					</div>
				</div>
			</div>
		</cfoutput>
	</body>
</html>
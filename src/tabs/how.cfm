<cfoutput>
	<div class="tab-pane" id="How">
		<h5 class="well well-small" style="margin-bottom:0;">Obfuscation</h5>
		<div style="padding:10px;">
			<p>Lobot obfuscate the [key] by overriding the Wheels core URLFor() function.</p>
			<ol>
				<li>Wheels call URLFor() to build a URL</li>
				<li>Lobot intercept the URLFor() call</li>
				<li>Lobot look for the [key] in the params struct</li>
				<li>The [key] is found and sent to the encryption function</li>
				<li>Lobot create a hashed value of the [key]</li>
				<li>The original [key] and the hashed value are encrypted together to create a new [key]</li>
				<li>The new [key] is then sent to the core URLFor() function to complete is routine</li>
			</ol>
		</div>

		<h5 class="well well-small" style="margin-bottom:0;">Deobfuscation</h5>
		<div style="padding:10px;">
			<p>Lobot deobfuscate the [key] by overriding the Wheels core $decryptParams() function, which is triggered at each request.</p>
			<ol>
				<li>Wheels call $decryptParams()</li>
				<li>Lobot intercept the $decryptParams() call</li>
				<li>Lobot look for the [key] in the params struct</li>
				<li>The [key] is found and sent to the decryption function</li>
				<li>Lobot decrypt the [key]</li>
				<li>The [key] is then compared to the hashed value</li>
				<li>If the comparison is successfull: the decrypted [key] is returned to the params struct</li>
				<li>If the comparison fails: the action is aborted</li>
			</ol>
		</div>

		<div class="alert alert-info" style="margin:0;">
			<p style="margin:0;">Any attempt to tamper the [key] will result in the action beign aborted.</p>
		</div>
	</div>
</cfoutput>
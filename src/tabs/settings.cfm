<cfoutput>
	<div class="tab-pane active" id="Settings">
		<div class="alert">
			<span class="label label-warning">Important</span> &nbsp;&nbsp;All the plugin settings should be place in config/settings.cfm files.
		</div>

		<div class="subcontent">
			<dl>
				<dt>Lobot activation <span class="pull-right" style="font-weight:normal;">Default: false</span></dt>
				<dd>To activate/deactivate lobot protection:
					<ul>
						<li><u>set(lobotProtectionIsEnabled=boolean)</u></li>
					</ul>
				</dd>
				<dt>Lobot secret protection key <span class="pull-right" style="font-weight:normal;">Default: GenerateSecretKey("AES")</span></dt>
				<dd>To specify a secret protection key:
					<ul>
						<li><u>set(lobotProtectionSecretKey="string")</u></li>
					</ul>
					<div class="alert alert-error" style="margin-top:20px;">
						After setting the secret protection key:
						<ol>
							<li>Lobot will encrypt the secret protection key with the "CFMX_COMPAT" algorythm.</li>
							<li>After beign encrypted, the original secret protection key is removed from the application scope.</li>
							<li>The new encrypted protection key is then used to encrypt/decrypt the [key].</li>
						</ol>
					</div>
				</dd>
				<dt>Lobot hash algorythm <span class="pull-right" style="font-weight:normal;">Default: "SHA"</span></dt>
				<dd>To specify the hash algorythm:
					<ul>
						<li><u>set(lobotHashAlgorythm="algorithm")</u></li>
					</ul>
				</dd>
			</dl>
		</div>
	</div>
</cfoutput>
<cfscript>
	component output=false {
		/*
			---------------------------------------------------------------------------------------------------
				Copyright © 2012 Simon Allard
				
				Licensed under the Apache License, Version 2.0 (the "License");
				you may not use this file except in compliance with the License.
				You may obtain a copy of the License at
				
					http://www.apache.org/licenses/LICENSE-2.0
				
				Unless required by applicable law or agreed to in writing, software
				distributed under the License is distributed on an "AS IS" BASIS,
				WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
				See the License for the specific language governing permissions and
				limitations under the License.
			---------------------------------------------------------------------------------------------------
		*/
		
		/* ---------------------------------------------------------------------------------------------------
		 * @hint Constructor
		 * ---------------------------------------------------------------------------------------------------
		*/
		public function init() {
			var loc = {};

			this.version = "1.1.8";

			/* ---------------------------------------------------------------------------------------------------
			 * APPLY DEFAULT SETTINGS IF NOT SUPPLIED IN --> (config/settings.cfm)
		 	 * ---------------------------------------------------------------------------------------------------
			*/
			// SET DEFAULT PROTECTION FLAG
			// - set(lobotProtectionIsEnabled=boolean) --> (config/settings.cfm)
			if ( !isDefined("application.wheels.lobotProtectionIsEnabled") ) {
				application.wheels.lobotProtectionIsEnabled = false;
			}

			// SET DEFAULT PROTECTION KEY
			// - set(lobotProtectionSecretKey="string") --> (config/settings.cfm)
			if ( !isDefined("application.wheels.lobotProtectionSecretKey") ) {
				application.wheels.lobotProtectionAlgorythm = "AES";
				application.wheels.lobotProtectionKey       = GenerateSecretKey(application.wheels.lobotProtectionAlgorythm);
			} else {
				application.wheels.lobotProtectionAlgorythm = "CFMX_COMPAT";
				application.wheels.lobotProtectionKey       = Encrypt(application.wheels.lobotProtectionSecretKey, application.wheels.lobotProtectionAlgorythm);

				StructDelete(application.wheels, "lobotProtectionSecretKey");
			}

			// SET DEFAULT HASH ALGORYTHM
			// - set(lobotHashAlgorythm="string") --> (config/settings.cfm)
			if ( !isDefined("application.wheels.lobotHashAlgorythm") ) {
				application.wheels.lobotHashAlgorythm = "SHA";
			}

			return this;
		}

		/* ---------------------------------------------------------------------------------------------------
		 * @hint Init plugin config
		 * ---------------------------------------------------------------------------------------------------
		*/
		public struct function getLobotSettings() {
			var loc = {};

			loc.plugin = {};
			loc.plugin.author        = "Simon Allard";
			loc.plugin.name          = "lobot";
			loc.plugin.version       = "1.0";
			loc.plugin.compatibility = "1.1.8";
			loc.plugin.project       = "https://github.com/ellor1138/Lobot";
			loc.plugin.documentation = "https://github.com/ellor1138/Lobot/wiki";
			loc.plugin.issues        = "https://github.com/ellor1138/Lobot/issues";
			loc.plugin.whoislobot1   = "http://starwars.com/explore/encyclopedia/characters/Lobot";
			loc.plugin.whoislobot2   = "http://starwars.wikia.com/wiki/Lobot";
			loc.plugin.concept       = "https://www.owasp.org/index.php/How_to_protect_sensitive_data_in_URL%27s";

			return loc;
		}

		// Encrypt [key]
		public function lobotEncryptKey(required any param) {
			var loc = {};

			loc.returnValue = Encrypt(arguments.param & "&lobot="& Hash(arguments.param, application.wheels.lobotHashAlgorythm), application.wheels.lobotProtectionKey, application.wheels.lobotProtectionAlgorythm, "Hex");

			return loc.returnValue;
		}

		// Decrypt [key]
		public function lobotDecryptKey(required any param) {
			var loc = {};

			try {
				loc.work = {};

				loc.work.value	   = arguments.param;
				loc.work.decrypted = Decrypt(loc.work.value, application.wheels.lobotProtectionKey, application.wheels.lobotProtectionAlgorythm, "Hex");
				loc.work.array 	   = ListToArray(loc.work.decrypted, "&");
				loc.work.key 	   = loc.work.array[1];
				loc.work.array 	   = ListToArray(loc.work.array[2], "=");
				loc.work.hash 	   = loc.work.array[2];

				if ( loc.work.hash == Hash(loc.work.key, application.wheels.lobotHashAlgorythm) ) {
					loc.returnValue = loc.work.key;
				}

				StructDelete(loc, "work");
			
			} catch(Any e) {
				// loc.returnValue = arguments.param;
				abort;
			}	

			return loc.returnValue;
		}

		/* ---------------------------------------------------------------------------------------------------
		 * @hint Hacked Wheels core functions
		 * ---------------------------------------------------------------------------------------------------
		*/
		public function $decryptParams(required struct params) {
			var loc = {};

			if ( application.wheels.lobotProtectionIsEnabled ) {
				for (loc.key IN arguments.params) {
					if ( loc.key == "key") {
						try {
							arguments.params[loc.key] = lobotDecryptKey(arguments.params[loc.key]);
						
						} catch(Any e){

						}
					}
				}
			
			} else if ( application.wheels.obfuscateUrls ) {
				for (loc.key IN arguments.params) {
					if (loc.key != "controller" && loc.key != "action") {
						try {
							arguments.params[loc.key] = deobfuscateParam(arguments.params[loc.key]);
						
						} catch(Any e) {

						}
					}
				}
			}
			return arguments.params;
		}

		public function URLFor() {
			var loc = {};

			if ( application.wheels.lobotProtectionIsEnabled ) {
				if ( Len(arguments.key) ) {
					if ( !IsObject(arguments.key) ) {
						arguments.key = lobotEncryptKey(arguments.key);						
					}					
				}
			}

			return core.URLFor(argumentCollection=arguments);
		}
	}
</cfscript>
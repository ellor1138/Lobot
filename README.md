# Lobot

## What is it?

Lobot is a [key] obfuscator plugin for ColdFusion on Wheels. This plugin offer a more secure solution to protect your application by obfuscating the [key]. The plugin create a hash of the [key] which is then encrypted with the [key] itself. On each request, the [key] is decrypted and compared to the hash value. If the comparison fails the action is aborted, otherwise the decrypted [key] is restored in the params struct.

## Benefits of using this plugin:
* The [key] is encrypted along with the hash value for comparison
* If the comparison is successfull: the [key] is restored in the params struct
* If the comparison fails: the action is aborted
* The obfuscated [key] is impossible to guess and tampering with it will abort the action
* Based on "<a href="https://www.owasp.org/index.php/How_to_protect_sensitive_data_in_URL%27s" target="_blank">How to protect sensitive data in URL's</a>"

## The Latest Version
* The latest version of this plugin can be found at the Github project page at https://github.com/ellor1138/Lobot
* The latest version of this plugin can also be found at the CFWheels website at http://cfwheels.org/plugins/listing/95

## Documentation
Documentation for this project can be found at https://github.com/ellor1138/Lobot/wiki

## Issues
Problems or issues with this plugin can be found at https://github.com/ellor1138/Lobot/issues

## Requirements
##### I have tested this plugin with the following CFWheels frameworks:
* ColdFusion on Wheels 1.1.8

##### I have tested this plugin on the following CFML engines:
* Adobe ColdFusion 9 Developer Edition

##### I have tested this plugin with the following databases:
* MSSQL Server 2008

## License
Copyright 2013 Simon Allard
				
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
				
http://www.apache.org/licenses/LICENSE-2.0
				
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" basis,
without warranties or conditions of any kind, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Who is Lobot?
He's the Brain, Sweetheart

* http://starwars.com/explore/encyclopedia/characters/Lobot
* http://starwars.wikia.com/wiki/Lobot
# clip_key  
_Store passwords encrypted_  

---  

## Dependencies  
  - `dunstify` _Optional, get notifications when key is copied_  
  - `gpg`  
  - `git`  
  - `xclip`  

# Usage  
__Encrypt a key:__
1. `lock_key <password_name>` _Prompts for the password (no-echo) and encrypts with your pgp-key_  

__Decrypt to clipboard:__  
1. `clip_key <password_name>` 
`clip_key` prompts for your pgp password if you have one set. Then decrypts the selected password
and pipes it to your clipboard. After 5 seconds it clears the clipboard.  

__Notifications:__ If dunstify _is_ installed it also creates a notification of which password 
was just decrypted.  

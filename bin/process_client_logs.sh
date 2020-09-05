TARGET=$1
cd "$TARGET"/var/log
cat * | awk '{FS = "[: ]"}; /Failed password for invalid user|Failed password for/{
	if($2=="")
		 print $1,$3,$4,$(NF-5),$(NF-3);
	 else
		 print $1,$2,$3,$(NF-5),$(NF-3);
	}' > failed_login_data.txt

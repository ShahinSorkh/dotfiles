function px
	if string match 'on' $argv[1]
		set -gx all_proxy http://127.0.0.1:2081
		set -gx https_proxy $all_proxy
		set -gx http_proxy $all_proxy
		set -gx ALL_PROXY $all_proxy
		set -gx HTTPS_PROXY $all_proxy
		set -gx HTTP_PROXY $all_proxy
        set -gx no_proxy 127.0.0.1/8,192.168.1.0/24,172.16.0.0/12
        set -gx NO_PROXY 127.0.0.1/8,192.168.1.0/24,172.16.0.0/12
	else if string match 'off' $argv[1]
		set -gu all_proxy
		set -gu https_proxy
		set -gu http_proxy
		set -gu ftp_proxy
		set -gu ALL_PROXY
		set -gu HTTPS_PROXY
		set -gu HTTP_PROXY
		set -gu FTP_PROXY
	else
		printf "Valid options are: on | off\n" >&2
	end
end

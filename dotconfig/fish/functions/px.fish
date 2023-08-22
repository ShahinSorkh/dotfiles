function px
	if string match 'on' $argv[1]
		set -gx all_proxy http://127.0.0.1:2081
		set -gx https_proxy $all_proxy
		set -gx http_proxy $all_proxy
	else if string match 'off' $argv[1]
		set -gu all_proxy
		set -gu https_proxy
		set -gu http_proxy
	else
		printf "Valid options are: on | off\n" >&2
	end
end

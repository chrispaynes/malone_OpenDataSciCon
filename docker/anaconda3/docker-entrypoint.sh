# If we're running as root, then run as the jupynb user. Otherwise
# docker is running with --user and we simply use that user.  Note
# that su-exec, despite its name, does not replicate the functionality
# of exec, so we need to use both
if [ "$(id -u)" = "0" ]; then
	userid="jupynb"
	groupid="jupynb"
	exec_cmd="exec su-exec jupynb"
else
	userid="$(id -u)"
	groupid="$(id -g)"
	exec_cmd="exec"
fi
readonly userid
readonly groupid
readonly exec_cmd

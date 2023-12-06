var scionURLRegexp = regexp.MustCompile(
	`^(\w*://)?(\w+@)?([^/?]*)(.*)$`)

func MangleSCIONAddrURL(url string) string {
	match := scionURLRegexp.FindStringSubmatch(url)
	if len(match) == 0 {
		return url // pass through on no match
	}

	schemePart := match[1]
	userInfoPart := match[2]
	hostPart := match[3]
	tail := match[4]
	return schemePart + userInfoPart +
		pan.MangleSCIONAddr(hostPart) + tail
}

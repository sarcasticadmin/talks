func MangleSCIONAddr(address string) string {
	raddr, err := snet.ParseUDPAddr(address)
	if err != nil {
		return address
	}

	// Turn this into [IA,IP]:port format.
	// This is a valid host in a URI, per
	// the "IP-literal" in RFC 3986, 3.2.2.
	mangledAddr := fmt.Sprintf("[%s,%s]",
		raddr.IA, raddr.Host.IP)
	if raddr.Host.Port != 0 {
		mangledAddr += fmt.Sprintf(":%d",
			raddr.Host.Port)
	}
	return mangledAddr
}

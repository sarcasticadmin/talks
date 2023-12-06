func natsDialScion(address string, pathPref string) (net.Conn, error) {
	var policy pan.Policy
	var err error
	if pathPref != "" {
		policy, err = pan.PolicyFromCommandline("", pathPref, false)
	} else {
        # Default policy
		policy, err = pan.PolicyFromCommandline("", "latency,bandwidth,hops,mtu", false)
	}
	addr, err := pan.ResolveUDPAddr(context.TODO(), address)
	tlsCfg := &tls.Config{
		InsecureSkipVerify: true,
		NextProtos:         nextProtos,
	}
	pathSelector := pan.NewDefaultSelector()
	ql, err := pan.DialQUIC(context.Background(), netaddr.IPPort{}, addr, policy, pathSelector, "", tlsCfg, nil)
	fmt.Println(pathSelector.Path())
	if err != nil {
		return nil, err
	}
	stream, err := quicutil.NewSingleStream(ql)
	if err != nil {
		return nil, err
	}
	return stream, nil
}

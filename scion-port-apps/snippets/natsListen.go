func natsListen(network, address string) (net.Listener, error) {
	if network == "scion" {
		tlsCfg := &tls.Config{
			Certificates: quicutil.MustGenerateSelfSignedCert(),
			NextProtos:   []string{quicutil.SingleStreamProto},
		}
		fulladdr := strings.Split(address, ",")
		rightaddr := fulladdr[len(fulladdr)-1]
		local, _ := netaddr.ParseIPPort(rightaddr)
		ql, e := pan.ListenQUIC(context.Background(), local, nil, tlsCfg, nil)
		return quicutil.SingleStreamListener{Listener: ql}, e
	} else {
		return natsListenConfig.Listen(context.Background(), network, address)
	}
}

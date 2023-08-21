## Long Abstract

The existing internet is a hostile place with many bad actors who are leveraging techniques like BGP hijacking, DNS
spoofing, and many others to gain access to company intellectual property, state secrets, and personal identifiable
information. Our existing internet architecture needs a net new, ground up approach to providing a secure by default,
scalable infrastructure.

SCION (Scalability, Control, and Isolation On Next-Generation Networks) is a modern Future Internet architecture that
aims to offer high availability and efficient point-to-point packet delivery, even in the presence of actively malicious
network operators and devices. Packet forwarding is at least as efficient in latency and throughput as current IP in
common cases and more scalable with respect to BGP and the size of routing tables.

SCION is running on a number of nodes around the world. The first ISPs to use SCION are Swisscom and SWITCH. Several
corporations have obtained SCION network connections through these ISPs to the corporate SCION network. Among the first
customer deployments are SNB, ZKB and SIX from the Swiss financial sector. As of 2018 it is an ongoing research project
led by researchers at ETH Zurich and,among other Future Internet proposals, is being explored in the Internet Engineering
Task Force research group for path-aware networking.

We'll cover the 2 approaches of porting applications to SCION and get into the pros/cons of the open source SCION
libraries around these approaches:

1. The path aware network (PAN) libraries that are required for an application to adopt SCION natively. Which can be
   found here: https://github.com/netsec-ethz/scion-apps/tree/master/pkg/pan

2. The SIG (SCION internet Gateway): https://github.com/scionproto/scion/tree/master/gateway With the benefit that it
   would require no modifications to an existing application.

We'll cover deploying an open source distributed application using to these approaches and what the results were in
performance and availability.

This talk should encourage those who are curious about adopting the SCION internet architecture and show how approachable
it is to get started.

## Short Abstract

Applications begin exposed across the SCION(Scalability, Control, and Isolation On Next-Generation Networks)
require one of the following:

1. Inclusion of the path aware networking (PAN) library in the application codebase

2. Leverage SCION Internet Gateway

We'll explore each approach using existing an open source distributed application including tests comparing the
performance and availability when compared to traditional IP networks.

The goal being to provide an overview for how approachable it is to adopt SCION.

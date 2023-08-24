## Meta

Title: A Global Message Bus on the SCION Internet Architecture

Audience: Developer

Track: Systems and Infrastructure

Brief Description: Leveraging SCION as a possible solution to the existing message bus challenges

## Long Abstract

The existing internet is a hostile place with many bad actors who are leveraging techniques like BGP hijacking, DNS
spoofing, and many others to gain access to company intellectual property, state secrets, and personal identifiable
information. This makes it incredibly difficult for a business to deploy distributed applications in a reliable and
performant manner. Our existing internet architecture needs a net new, ground up approach to providing a secure by default,
scalable infrastructure and applications that can leverage these approaches.

Enter SCION (Scalability, Control, and Isolation On Next-Generation Networks) a modern Future Internet architecture that
aims to offer high availability and efficient point-to-point packet delivery, even in the presence of actively malicious
network operators and devices. Packet forwarding is at least as efficient in latency and throughput as current IP in
common cases and more scalable with respect to BGP and the size of routing tables.

To showcase the benefits of SCION in a real world setting, we'll compare operating a Golang message bus as a common
communication point across applications distributed globally across the internet and then with SCION.

The agenda will be:

1. A general overview of a message bus.

2. The existing challenges of running distributed message bus across the internet. What tradeoffs do engineers and
   administrators have to make given today limitations.

3. Leveraging SCION as a possible solution to the existing message bus challenges. Enabling the path aware network
   (PAN) Golang libraries that are required for an application to adopt SCION natively. Source
   can be found here: https://github.com/netsec-ethz/scion-apps/tree/master/pkg/pan

4. Results of using SCION architecture compared to the existing internet in performance and availability.

This talk should encourage those who are curious about an alternative to the existing internet security posture,
adopting the SCION internet architecture, and show how approachable it is to get started with SCION.

More information:

SCION is running on a number of nodes around the world. The first ISPs to use SCION are Swisscom and SWITCH. Several
corporations have obtained SCION network connections through these ISPs to the corporate SCION network. Among the first
customer deployments are SNB, ZKB and SIX from the Swiss financial sector. As of 2018 it is an ongoing research project
led by researchers at ETH Zurich and,among other Future Internet proposals, is being explored in the Internet Engineering
Task Force research group for path-aware networking.

## Short Abstract

Operating a message bus globally across the internet is challenging and risky. We'll explore an alternative approach
using SCION(Scalability, Control, and Isolation On Next-Generation Networks), what's needed for applications to adopt
SCION, and the results of doing so when compared to today's internet.

The goal is to provide an overview of the benefits of adopting SCION as an alternative for routing traffic across the
globe using a real world use case.

## Metadata

Title: Porting the NATS Message Bus to the SCiON Internet Architecture

## Long Abstract

Building and operating reliable distributed systems is an ongoing challenge. NATS provides a system that's easier
than most other distributed systems. But CAP theorem highlights the inherent tradeoffs in these systems,
which get amplified when traffics has to traverse wide area networks like the public internet.

What if there was a way to improve the underlying connectivity and network that a
distributed system relies upon? The SCiON (Scalability, Control, and Isolation On Next-Generation Networks)
Internet Architecture aims to offer secure, highly available, and efficient point-to-point packet delivery
via a path-aware network. What's required to port over an existing distributed system technology to use such
a network? Using NATS on top of SCiON, what were the realized benefits in practice?

## Short Abstract

What if it were possible to replace TCP/IP? The SCiON (Scalability, Control, and Isolation On Next-Generation Networks)
Internet Architecture is a secure, highly available, and efficient path-aware network. What kinds of benefits could be
realized when SCiON is combine with a distributed systems software like NATS after +50 years of TCP/IP dominance?

## Intro

- Me

- Opener or attention-grabbing slide <- Open to ideas

- Importance and relevance of the talk: Availability, Reliability and Security

- Presentation Agenda

## Message Bus Overview

- What are the benefits

- What are the challenges:
  - Security
  - CAP Theorum, etc
  - Internet

## SCiON Overview

- Brief Overview of SCiON
- Capabilities:
  - E2E TLS
  - Control of the network path
  - Utilize multiple paths
  - Fast Failover
  - DDos Protections

> NOTE: Good reference to SCiON benefits from SCiON Day 2023: https://youtu.be/3Y1nSwVPV4c?si=S1xWyU3-yTJnKXN0&t=52

## Porting NATS to SCiON

- Reasons for choosing NATs
  - PAN Library
  - Straight forward codebase
- Challenges:
  - Only support for TCP
  - URL formatting
  - client/server and multiple components of server
- Current state
  - SCiON enabled via QUIC
  - Which NATs components that are SCiON enabled (client, server, server-clustering)
- Results
  - Fast Failover time
  - < Ideas about other results that I can leverage > 
- Demo
  - Ideally Id like to show a SCiON topology with multiple hops. 1) Simulate a failure 2) Introduce less than ideal conditions into a link

## Conclusion

- NATS specific next steps
  - NATs customDialer for server
  - TLS integration with existing NATs TLS functions
  - Multipath support
- General
  - Overview of the benefits that can be gained by SCiON
  - Guide for others to port their applications
- Closing slide

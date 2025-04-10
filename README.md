
# IKEv2 VPN Dockerized

## Project Description

This project aims to create a VPN based on **IKEv2/IPSec**, fully executed within a **Docker containerized environment**. It was developed as a study lab to deeply understand the negotiation and encryption mechanisms of the IKEv2 protocol, analyzing its behavior through tools like **Wireshark**.

> Containerization provides **portability**, **scalability**, and **ease of management** of the VPN in cloud environments or distributed infrastructures.

## Technologies and Tools Used

- **Docker**: To create an isolated and replicable environment.
- **StrongSwan**: Open-source implementation of the IKEv2/IPSec protocol.
- **Wireshark**: For monitoring and analyzing network traffic.
- **tcpdump**: For packet capture inside containers.

## Architecture and Implementation

### Docker Environment Setup

Note: **For more detailed information, refer to "GUIDA_Configurazione VPN IKEv2.txt"**

- Custom network `myvpn` with subnet `192.168.1.0/24`
- Two containers:
  - `node1`: IP `192.168.1.2`
  - `node2`: IP `192.168.1.3`
- Installation of:
  - `strongswan`
  - `iproute2`
  - `iputils-ping`
  - `tcpdump`
  - `nano`

### IKEv2 VPN Configuration
- Setup of `/etc/ipsec.conf` on both nodes
- Authentication with **pre-shared key (PSK)**
- Security parameters:
  - Encryption: AES-256
  - Integrity: SHA2-256
  - Key exchange: MODP2048 (DH Group 14)
- Configuration of detailed logs (`/etc/strongswan.conf`)
- PSK added to `/etc/ipsec.secrets`

### VPN Startup and Traffic Generation

- Start the tunnel: `ipsec up ikev2-vpn`
- Connectivity test with `ping`
- Packet capture with `tcpdump`
- Save traffic to `.pcap` files

### Analysis with Wireshark

- Decryption of IKEv2 and ESP packets
- Key extraction from `charon.log` or `ip xfrm state`
- Study of the IKE_SA_INIT and IKE_AUTH sequences
- Examination of **CHILD SA** creation and negotiated parameters

## Insights

During the development of the project, a **theoretical and practical analysis** of the IKEv2 protocol's functioning was carried out, highlighting:
- The complete negotiation flow (IKE_SA_INIT and IKE_AUTH)
- Use of ESP messages for encrypted traffic
- Support for MOBIKE for dynamic IP changes
- The **decryption** process of the traffic

## Authors

- Andrea Esposito – M63001650  
- Stefano Angelo Riviello – M63001592

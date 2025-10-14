# Offense-to-Defense-A-Kali-Linux-Guide-to-Reverse-Shells-and-Backdoors

**Short description**  
Demonstrates a full penetration testing workflow in a lab: reconnaissance, controlled exploitation, reverse shell establishment, privilege verification, and defensive validation.

---

## Key Techniques
- Coordinated reverse-shell setup and listener management.
- Controlled access to system artifacts for educational analysis (read-only where possible).
- Defensive hardening tests: fail2ban, auditd, file-integrity monitoring (Tripwire).

---

## Prerequisites
- VirtualBox (or equivalent) with isolated internal network.
- Attacker VM: Kali Linux or equivalent.
- Target VM: OWASP Broken Web Applications (BWA) or intentionally vulnerable image.
- Tools: `nmap`, `netcat` (for lab use), `auditd`, `fail2ban`.

---

## Quick Start (summary — non-executable)
1. Deploy attacker and target VMs on an isolated internal network.  
2. Perform non-destructive reconnaissance (service discovery and enumeration).  
3. Execute controlled demonstration steps from the lab notebook to illustrate the exploit chain and then show defensive mitigations and log evidence.  
4. Use snapshots to restore target VM after each demonstration.

> Use VM snapshots for safe rollback. All scripts and payloads in this folder are for offline lab demonstration only.

---

## Safety & Ethics
- Only run tests on systems you own or have explicit permission to use.
- Never use provided methods against production systems or networks.
- Maintain full traceability and documentation of the lab steps.

---

## Artifacts & Docs
- `docs/` — step-by-step report, screenshot logs, commands explained.
- `configs/` — example auditd and fail2ban configs used for demonstration.

---

## Defensive Recommendations
- Enforce least privilege for services.
- Block unnecessary outbound ports and implement egress filtering.
- Enable auditing and centralized logging to detect anomalous executions.

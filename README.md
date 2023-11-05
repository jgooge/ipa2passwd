# ipa2passwd

ipa2passwd is a Bash script that enables legacy applications that rely on a traditional Unix-style ``passwd`` file to integrate with FreeIPA/IDM user management solutions.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them:
* Access to an account with permissions to read IPA

### Deployment

Clone the repository
```bash
git clone https://github.com/jgooge/ipa2passwd.git
```
Navigate to the script directory
```bash
cd ipa2passwd
```
Make the script executable
```bash
chmod +x ipa-passwd-gen.sh
```
Authenticate to IPA
```bash
kinit <username>
```
Run the script
```bash
./ipa-passwd-gen.sh
```

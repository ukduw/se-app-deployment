# Intro to cloud computing
On Premises (On Prem) - local data centres for your own digital services

## Cloud computing
Cloud computing - computing resources accessed over the internet on demand

- Often has a service platform (GUI)
- Usually has pay-as-you-go pricing
    - Big reason for cloud popularity vs local
- Go global fast (as opposed to opening up local servers in other countries)
- Access the cloud from anywhere
- Less to manage/maintain

## Examples of popular cloud services
- Netflix, Disney+, Prime Video
- Spotify, Soundcloud, Apple Music
- Outlook, Email services
- Google Maps, Apple Maps
- YouTube
- Microsoft 365
- Google Drive, OneDrive, Dropbox
- GitHub
- Steam, PSN, Xbox Live
- GeForce NOW, Xbox cloud



## Cloud Deployment Models
From a business perspective, how you're using the cloud
- **Public cloud** - shared tenancy - physically using the same server, so resources are split between companies (have their own partition, but technically all using one server)
- **Private cloud** - single tenancy - when sole "ownership" of a physical server is needed
    - e.g. government, financial organizations... anyone with particularly sensitive data
- **Hybrid cloud** - where a company uses both public and private cloud, linked via network
    - Best of both worlds, can work out cheaper, but becomes more complex
- **Multi-cloud** - using multiple providers - requires integration between clouds
    - Resilience/backup - legally required for financial services
    - Some service providers are better at different things, like GoogleCP and data/ML
    - Tradeoff is complexity


## Cloud Service Types (XaaS)
Determines how much responsibility is taken on by the user vs provider
- **IaaS - Infrastructure** - physical and networking components are the only provider responsibilities - the physical hardware is rented and everything else is up to the user
    - You bring the config, code and data
- **PaaS - Platform** - env is provided, application is up to the user
    - You bring code and data
- **SaaS - Software** - "out of the box" services - all(?) of the popular cloud service examples above; almost all responsibility is on the provider - software runs on the cloud and you use it via the internet
    - You bring data
- **FaaS - Function** - when you don't need an entire piece of software (SaaS) nor want to write your own (PaaS) - only a small function that triggers on some condition; no need to pay to run a server 24/7


## Advantages and disadvantages of cloud computing
### Advantages
- Cost efficiency
    - No need to pay for expensive hardware
    - Only pay for what you use
        - e.g. you have a site that gets significantly busier around Christmas - you pay more for a couple months, as opposed to buying enough hardware for max usage, only to use a fraction of it 90% of the time
    - Less CapEx, more OpEx
        - Capital Expenditure (upfront cost), Operating Expenditure (ongoing cost)
        - Companies prefer latter, so they have more capital to work with
- Accessibility (from anywhere in the world)
    - Collaboration ++
- Faster global deployment
- Less responsibility
    - Maintenance and security (physical)
    - No need to pay people with expertise to handle these things
- Innovation
    -Easier to experiment, test...

### Disadvantages
- Lack of control
- Requires cloud expertise
    - A tradeoff of types of expertise
- Internet- and bandwidth-dependent
- Lack of ownership of resources
- Different security concerns/points of attack
- Must be managed properly to not lead to spiralling costs
    - There are enterprise level roles dedicated just to managing cloud finances
- Vendor lock in
- Compliance issues (e.g. financial, governmental institutions...)
- Service outages


## Marketshare
1. Amazon Web Services (AWS)
2. Azure (Microsoft)
3. Google Cloud Platform (GCP)

**Other providers**: Alibaba, Cloudflare, Oracle, Digital Ocean, IBM, Salesforce, etc.

**AWS** - A lot of services, longest established, large community and documentation

**Azure** - Microsoft ecosystem integration, Azure DevOps

**GCP** - Data focused, innovative, most global network, tend to be fairly cheap at scale, easier to connect with other providers (makes it very popular second choice)



## Physical
- **Availability zone** - physically separate, isolated data centers (AWS clusters them per region) within a geographical region - interconnected with high-bandwidth, low-latency networks so they can automatically failover between zones in the case of localized failure
    - Independent power, cooling, networking
- **Edge location** - strategically placed, geographically dispersed data centers (or point of presence) - brings cloud services closer to users/data sources
    - Goal is to reduce latency, improve performance, increase scalability
    - Via processing data at "edge" of network rather than a distant central data center


## Virtual Machines
A computer emulated on a computer
- On local PC, you assign x CPUs, y RAM
- Inelastic and, on a personal machine, resource intensive
- On cloud, the hardware is 1000s of CPUs, sticks of ram, etc...

- PC -> SSH -> GUI-less VM on remote server


## SSH - Secure Shell
- Uses **key pair**
    - 2 files - **private key, public key**
    - Key and lock
    - Set of security credentials that you use to prove your identity when connecting to an instance
- Encrypted - only with key pair can you "unscramble"/decrypt messages

misc
- Port 22 standard
- SSH uses TCP protocol
- Can set it so only certain IP addresses are allowed
    - 0 in an IP address is a wildcard



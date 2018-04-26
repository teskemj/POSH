# Azure Boot Camp

* hybrid benefit
* D series vm's are general purpose
* A series vms's are test prod
* Choose east or west datacenters. Northcentral is fairly saturated

## Update Managment in Azure
* Solution-> maintenance-> update management
* Do not provision on public IPs
* F5 Big IP
* Use Keyvault 
* DO not create a new Vnet for every virtual machine
* this is another

## Azure Database Options

* Jes Borland
* @grrl_geek
* lessthandot.com
* Scaling is why you do Azure
* Backup to URL (BLOB)is recommended
* SQL Server and SQL Database are two different things
    * Install SQL server on a VM in Azure. All functionality
    * SQL Database does not have features, but leverages scaling better. Worry about code, not maintenance
    * Newer features faster
    * Single database
    * Elastic Pools database
        * group of databases share a pool
        * Great for SaaS
        * varying unpredictable workloads
        

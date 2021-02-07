Write-Host "Download Puppet modules for masterless run"
puppet module install puppetlabs-chocolatey --version 5.0.2
puppet module install puppetlabs-powershell --version 3.0.1
# puppet module install puppetlabs-pwshlib --version 0.4.1
puppet module install puppetlabs-motd --version 4.1.1
# puppet module install puppetlabs-registry --version 2.1.0
# puppet module install puppetlabs-stdlib --version 6.3.0
puppet module install puppetlabs-translate --version 2.2.0
puppet module install puppetlabs-puppet_agent --version 4.0.0
# puppet module install puppetlabs-inifile --version 4.2.0
# puppet module install puppetlabs-apt --version 7.4.2
# puppet module install puppetlabs-facts --version 1.0.0
puppet module install puppetlabs-wsus_client --version 3.1.0 --ignore-dependencies
puppet module install puppetlabs-acl --version 3.1.1
puppet module install tragiccode-azure_key_vault --version 1.1.0
Write-Host "Done download Puppet modules for masterless run"
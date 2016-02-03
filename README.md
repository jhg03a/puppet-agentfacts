# agentfacts

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with agentfacts](#setup)
    * [What agentfacts affects](#what-agentfacts-affects)
    * [Beginning with agentfacts](#beginning-with-agentfacts)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Changelog](#changelog)

## Overview

This is a module to convert agent local configuration data to a structured fact.  While not super helpful by itself, it is handy in conjunction with other modules.  For example, being able to reference the puppet agent SSL certificate location information from your mCollective profile.  It could also be handy when diagnosing what's going on with a particular agent, planning for an upgrade, or figuring out which agents are running as non-default users.

## Module Description

This module utilizes the Puppet.settings global variable and converts the output to a structured fact.

For example you may want to know where the ssl keys and certificates are stored on a given agent.  You should be able to reference the values `agentfacts.hostpubkey`, `agentfacts.hostprivkey`, and `agentfacts.localcacert` for all the appropriate information.  You could use this for instance to create SSL connections to your puppetdb instance to run queries, or as part of your mCollective agent setup.  Another handy entry to keep in mind is `agentfacts.environment` if you needed to run puppetdb queries against only a particular environment's nodes.

Since this is pulling from the puppet ruby code, it ignores the differences between OS.  So `agentfacts.hostpubkey` on linux may look something like `/etc/puppetlabs/puppet/ssl/public_keys/my_test_box.domain.com.pem`.  However on Windows it may look something like `C:/ProgramData/PuppetLabs/puppet/etc/ssl/public_keys/my_test_box.domain.com.pem`.

## Setup

### What agentfacts affects

This is a read-only module and cannot alter agent information

### Beginning with agentfacts

Add this puppet module to your catalog and you should get facts about each puppet agent configuration on your next puppet run.

## Reference

This adds all the entries from `puppet config print` as children of the agentfacts structured fact.  What values that show up exactly will vary based on your version of the puppet agent and what you may have defined in configuration files.  You can refer to [the documentation](https://docs.puppetlabs.com/references/latest/configuration.html) for the specific contents.

## Development

1. Fork it
2. Submit a pull request

## Changelog

- v1.0.2 - Fixed bug which wouldn't have set the environment properly when running from facter
- v1.0.1 - Added additional documentation to readme
- v1.0.0 - Initial Release
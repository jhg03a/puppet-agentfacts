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

This is a module to convert agent local configuration data to a structured fact.  While not super helpful by itself, it is handy in conjunction with other modules.  For example, being able to reference the puppet agent SSL certificate location information from your mCollective profile.

## Module Description

This module utilizes the Puppet.settings global variable and converts the output to a structured fact.

## Setup

### What agentfacts affects

This is a read-only module and cannot alter agent information

### Beginning with agentfacts

Add this puppet module to your catalog and you should get facts about each puppet agent configuration on your next puppet run.

## Reference

This adds all the entries from `puppet config print` as children of the agentfacts structured fact.


## Development

1. Fork it
2. Submit a pull request

## Changelog

- v1.0.0 - Initial Release
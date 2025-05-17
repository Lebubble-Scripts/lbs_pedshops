# lbs_pedshops

A simple ped shop script for FiveM.

## Features

- Ped-based shop locations
- Buy and sell items with configurable prices
- Supports multiple frameworks and inventories

## Framework Support

- [ ] QBCore
- [x] QBox
- [ ] ESX

## Inventory Support

- [x] ox_inventory
- [ ] qb-inventory

## Installation

1. Download or clone this repository.
2. Add `lbs_pedshops` to your server resources.
3. Ensure dependencies (`ox_lib`, your framework, and inventory) are started before this resource.
4. Configure `shared/config.lua` as needed.

## Usage

Peds will spawn at predetermined locations. Interact with them to open the shop menu.

## Configuration

Edit [shared/config.lua](shared/config.lua) to set your framework and inventory options.

## License

MIT License
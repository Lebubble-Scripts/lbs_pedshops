# lbs_pedshops

A simple ped shop script for FiveM.

## Features

- Ped-based shop locations
- Buy and sell items with configurable prices
- Supports multiple frameworks and inventories

## Framework Support

- [x] QBCore
- [x] QBox

## Inventory Support

Inventory Systems are autodetected. You do not need to set them in config.lua. 
If your inventory system is not supported here, you will not be able to use the script. 

- [x] ox_inventory
- [x] qb-inventory

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

```
MIT License

Copyright (c) 2025 Lebubble Scripts

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```

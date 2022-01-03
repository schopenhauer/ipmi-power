# ipmi-power

This app lets you power cycle your machine remotely using the [Intelligent Platform Management Interface](https://en.wikipedia.org/wiki/Intelligent_Platform_Management_Interface) (IPMI) protocol. You may also configure a schedule to automatically power on/off your system.

The app has been successfully tested with the [Supermicro A2SDi-4C-HLN4F](https://www.supermicro.com/products/motherboard/atom/A2SDi-4C-HLN4F.cfm) motherboard. 

## Requirements

- Please make sure you have `freeipmi` or `ipmitool` installed on your system.

## Configure

Set the following environment variables:

| Environment variable | Description |
| --- | --- |
| `IPMI_NAME` | Server name |
| `IPMI_HOST` | Hostname or IP address |
| `IPMI_USERNAME` | Username |
| `IPMI_PASSWORD` | Password |

You can specify your custom power on/off schedule in the `schedule.yml` file and enable/disable the feature using the `auto_power` flag. This feature is disabled by default.

## Usage

Install the gems, then run the app.

```
bundle install
foreman start
```

## Contribute

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

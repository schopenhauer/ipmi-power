# ipmi-power

This app helps you power cycle a remote machine using the [Intelligent Platform Management Interface](https://en.wikipedia.org/wiki/Intelligent_Platform_Management_Interface) (IPMI) protocol. The app has been successfully tested with the [Supermicro A2SDi-4C-HLN4F](https://www.supermicro.com/products/motherboard/atom/A2SDi-4C-HLN4F.cfm) motherboard. You may also configure a schedule to automatically power on/off your system.

## Requirements

- Please install `freeipmi` or `ipmitool` on your system.

## Usage

Set the following environment variables:

- Server name: `IPMI_NAME`
- Hostname or IP address: `IPMI_HOST`
- Username: `IPMI_USERNAME`
- Password: `IPMI_PASSWORD`

Install the gems, run the app.

```
bundle install
foreman start
```

## Configuration

You can specify your custom power on/off schedule in the `schedule.yml` file and enable/disable the feature using the `auto_power` flag. This feature is disabled by default.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
